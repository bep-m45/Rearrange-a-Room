class Admins::RoomCommentsController < ApplicationController
  
  def destroy
    @room_comment = RoomComment.find(params[:id])
    @room_comment.destroy
    redirect_to request.referer
     
  end
  
   private  
  
  def room_comment_params
  params.require(:room_comment).permit(:comment)
  end
  
end
