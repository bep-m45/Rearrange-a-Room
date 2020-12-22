class ChatsController < ApplicationController
  before_action :authenticate_member!

  def create
    @chat = Chat.create
    @entry1 = Entry.create(chat_id: @chat.id, member_id: current_member.id)
    @entry2 = Entry.create(params.require(:entry).permit(:member_id, :chat_id).merge(chat_id: @chat.id))
    redirect_to chat_path(@chat.id)
  end

  def show
    @chat = Chat.find(params[:id])

   if Entry.where(member_id: current_member.id,chat_id: @chat.id).present?
      @messages = @chat.messages
      @message = Message.new
      @entries = @chat.entries
   else
      redirect_back(fallback_location: root_path)
   end
  end
  
end
