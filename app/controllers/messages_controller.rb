class MessagesController < ApplicationController
  before_action :authenticate_member!

  def create
    Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
    @message = Message.new(message_params)
    
    if @message.save
       flash[:notice] = "メッセージを送信しました"
       redirect_to chat_path(@message.chat.id)
    else
       render "chat/show"
       flash[:notice] = "メッセージの送信に失敗しました"
    end
  end

  private

  def message_params
    params.require(:message).permit(:member_id, :comment, :chat_id).merge(member_id: current_member.id)
end

end

