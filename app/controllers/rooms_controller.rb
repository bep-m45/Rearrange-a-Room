class RoomsController < ApplicationController
  def index
    @rooms = Room.all
   
  end

  def new
    @room = Room.new
    
  end

  def create
    @room = Room.new(room_params)
    @room.member_id = current_member.id
    @room.save
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @member = @room.member
    @room_comment = RoomComment.new
    @room_comments = @room.room_comments
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to member_path(current_member.id)
  end
  
  def destroy
     @member = Member.find(params[:id])
     @member.destroy
    redirect_to member_path(current_member)
  end  

 private
  def room_params
  params.require(:room).permit(:member_id, :size, :production, :image,  :room_layout_id, :room_genre_id, :room_image_id)
  end
end


