class MessagesController < ApplicationController
   before_action :authenticate_member!
  def create
      Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
    if @message = Message.create(params.require(:message).permit(:member_id, :chat_id).merge(member_id: current_member.id))
      flash[:notice] = "メッセージを送信しました"
      redirect_to chat_path(@message.chat.id)
    else
      flash[:notice] = "メッセージの送信に失敗しました"
      render "chats/show"
    end
  end
end

