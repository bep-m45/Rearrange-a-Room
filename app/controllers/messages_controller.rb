class MessagesController < ApplicationController
  before_action :authenticate_member!

  def create
    Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
    @message = Message.new(message_params)
    @chat =@message.chat
    if @message.save
      @messages = @chat.messages
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
      flash[:notice] ="Messageを削除しました"
    end
  end
    

  private

  def message_params
    params.require(:message).permit(:member_id, :comment, :chat_id).merge(member_id: current_member.id)
  end

end

