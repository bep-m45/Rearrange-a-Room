class RoomCommentsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @room_comment = @room.room_comments.new(room_comment_params)
    @room_comment.member_id = current_member.id
    @room_comment.save
    redirect_to request.referer
  end
  
  def destroy
    @room = Room.find(params[:room_id])
    @room_comment = RoomComment.find(params[:id])
    @room_comment.destroy
    redirect_to request.referer
  end
  
  private  
  
  def room_comment_params
  params.require(:room_comment).permit(:comment)
  end
  
end
