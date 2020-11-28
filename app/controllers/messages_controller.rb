class MessagesController < ApplicationController
  
  def create
    if Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
      @message = Message.create(params.require(:message).permit(:member_id, :comment, :chat_id).merge(member_id: current_member.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/chats/#{@message.chat_id}"
  end
end

