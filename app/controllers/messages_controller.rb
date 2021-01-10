class MessagesController < ApplicationController
  before_action :authenticate_member!

  def create
    Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
    @message = Message.new(message_params)
    @chat = @message.chat
    if @message.save
      @messages = @chat.messages
      
       @chatmembernotme=Entry.where(chat_id: @chat.id).where.not(member_id: current_member.id)
            @theid=@chatmembernotme.find_by(chat_id: @chat.id)
            notification = current_member.active_notifications.new(
                room_id: @chat.id,
                message_id: @message.id,
                visited_id: @theid.member_id,
                visitor_id: current_member.id,
                action: "dm"
            )
            # 自分の投稿に対するコメントの場合は、通知済みとする
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
            # ここまでを追加
      
      flash[:notice] = "メッセージを送信しました"
    else    
      @entries = @chat.entries
      render "chats/show"
      flash[:notice] = "メッセージの送信に失敗しました"
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @chat = @message.chat
    @chat.member_id = current_member.id
    if @message.destroy
      @messages = @chat.messages
      flash[:notice] ="メッセージを削除しました"
    end
  end
    

  private

  def message_params
    params.require(:message).permit(:member_id, :comment, :chat_id).merge(member_id: current_member.id)
  end

end

