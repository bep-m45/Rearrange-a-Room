class MembersController < ApplicationController
  before_action :authenticate_member!, only: [:show, :edit, :create, :following, :followers, :resign]
  before_action :current_member, only: [:edit, :update]

  def index
   @members = Member.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
    @rooms = @member.rooms.order(created_at: :desc).page(params[:page]).per(9)
    @current_member_entry = Entry.where(member_id: current_member.id)
    @member_entry = Entry.where(member_id: @member.id)

    unless @member.id == current_member.id
      @current_member_entry.each do |cu|
        @member_entry.each do |u|
          if cu.chat_id == u.chat_id then
            @is_chat = true
            @chat_id = cu.chat_id
          end
        end
      end
      if @is_chat
      else
        @chat = Chat.new
        @entry = Entry.new
      end
    end

    my_chats_ids = []
    @current_member_entry.each do | entry |
      my_chats_ids << entry.chat.id
    end
    @another_entries = Entry.where(chat_id: my_chats_ids).where('member_id != ?', @member.id)
  end

  def edit
    @member = Member.find(params[:id])

    if @member.id != current_member.id
      redirect_to member_path(current_member.id)
    end
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      flash[:notice] ='MY PAGEが編集されました'
      redirect_to member_path(@member.id)
    else
      flash[:notice] ='MY PAGEの編集に失敗しました'
      render 'edit'
    end
  end

  def following
    @member  = Member.find(params[:id])
    @members = @member.following
    @current_member_entry = Entry.where(member_id: current_member.id)

    my_chats_ids = []
    @current_member_entry.each do | entry |
      my_chats_ids << entry.chat.id
    end
    @another_entries = Entry.where(chat_id: my_chats_ids).where('member_id != ?', @member.id)
    render 'following'
  end

  def followers
    @member  = Member.find(params[:id])
    @members = @member.followers
    @current_member_entry = Entry.where(member_id: current_member.id)

    my_chats_ids = []
    @current_member_entry.each do | entry |
      my_chats_ids << entry.chat.id
    end
    @another_entries = Entry.where(chat_id: my_chats_ids).where('member_id != ?', @member.id)
    render 'followers'
  end

  def resign
  end

  def resign_update
    current_member.update(is_deleted: true)
    if @member.is_deleted == true
       @member.rooms.destroy_all
    else
    end
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :nickname, :email, :profile_image, :profile )
  end
end