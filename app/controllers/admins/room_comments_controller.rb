class Admins::RoomCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    
    @room_comment = RoomComment.find(params[:id])
  
  
    
    if @room_comment.destroy
       flash[:notice] = "コメントを削除しました"
       redirect_to request.referer
    end
  end
  
  private  
  
  def room_comment_params
    params.require(:room_comment).permit(:comment, :room_id, :member_id, :parent_id)
  end
  
end
