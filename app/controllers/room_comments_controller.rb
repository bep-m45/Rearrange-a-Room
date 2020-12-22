class RoomCommentsController < ApplicationController
before_action :authenticate_member!
  
def create
  @room = Room.find(params[:room_id])
  @room_comment = current_member.room_comments.build(room_comment_params)
    
  if @room_comment.save
     @room_comments = RoomComment.all
     flash[:notice] = "コメントが投稿されました"
  else 
     @room_comments = @room.room_comments
     @room_comment_reply = @room.room_comments.build
     @member = @room.member
     flash[:notice] ='コメントの投稿に失敗しました'
     render "rooms/show"
  end
end

def destroy
  @room = Room.find(params[:room_id])
  @room_comment = RoomComment.find(params[:id])
  @room_comment.destroy
  @room_comments = RoomComment.all
  flash[:notice] = "コメントを削除しました"
end

private

def room_comment_params
  params.require(:room_comment).permit(:comment, :room_id, :member_id, :parent_id)
end

end
