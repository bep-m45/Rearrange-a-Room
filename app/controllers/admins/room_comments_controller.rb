class Admins::RoomCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @room_comment = RoomComment.find_by(params[:room_comment])
    @room_comment.destroy
    redirect_to request.referer
     
  end
  
   private  
  
  def room_comment_params
  params.require(:room_comment).permit(:comment, :room_id, :member_id, :parent_id)
  end
  
end
