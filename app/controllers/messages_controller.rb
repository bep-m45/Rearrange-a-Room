class MessagesController < ApplicationController
   before_action :authenticate_member!
  def create
    if Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
      @message = Message.create(params.require(:message).permit(:member_id, :comment, :chat_id).merge(member_id: current_member.id))
      flash[:alert] = "メッセージを送信しました。"
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
    redirect_to "/chats/#{@message.chat_id}"
  end
end

