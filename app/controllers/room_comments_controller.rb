class RoomCommentsController < ApplicationController
   before_action :authenticate_member!
  def create
    @room = Room.find(params[:room_id])
    @room_comment = @room.room_comments.new(room_comment_params)
    @room_comment.member_id = current_member.id
    if @room_comment.save
      flash[:notice] = "コメントを投稿しました"
    else
      flash[:notice] = "コメントの投稿に失敗しました"
    end
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
