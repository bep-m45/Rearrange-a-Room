class MessagesController < ApplicationController
   before_action :authenticate_member!
  def create
      Entry.where(member_id: current_member.id, chat_id: params[:message][:chat_id]).present?
    if @message = Message.create(message_params)
      redirect_to chat_path(@message.chat.id)
      flash[:notice] = "メッセージを送信しました"
    else
      render "chats/show"
      flash[:notice] = "メッセージの送信に失敗しました"
    end
  end
  
  # def destroy
  #   @message = Message.find(params[:id])
  #   if @message.destroy
  #     flash[:notice] = "メッセージを削除しました"
  #   　redirect_to redirect_back(fallback_location: root_url)
  #   else  flash[:notice] = "メッセージの削除に失敗しました"
  #     render "chats/show"
  #   end
  # end
    private
    
    def message_params
       params.require(:message).permit(:member_id, :comment, :chat_id).merge(member_id: current_member.id)
    end
end

