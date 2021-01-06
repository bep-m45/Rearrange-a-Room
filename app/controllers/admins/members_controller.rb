class Admins::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
    @rooms = @member.rooms.order(created_at: :desc).page(params[:page]).per(9)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member =Member.find(params[:id])
    
    if @member.update(member_params)
      if @member.is_deleted == true
         @member.rooms.destroy_all
      else
      end
      flash[:notice] = "お客様情報を更新しました"
      redirect_to admins_members_path
    else
      render 'admins/members/edit'
    end
  end
  
  def member_rooms
    @member = Member.find(params[:member_id])
    @rooms = @member.rooms.order(created_at: :desc).page(params[:page]).per(9)
  end
  
  private

  def member_params
    params.require(:member).permit(:is_deleted, :name, :nickname, :email, :profile_image, :profile)
  end
end
