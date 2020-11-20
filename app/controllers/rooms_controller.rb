class RoomsController < ApplicationController
  def index
    
  end
  
  def new
    @room = Room.new
  end
  
  def create
  
  @room = Room.new(room_params)
  @room.member_id = current_member.id
  @room.save
  redirect_to room_path(id: current_member.id)
  end
  
  def show
    @room =Room.find(params[:id])
    
  end

  def edit
  end

 


 private
  def room_params
  params.require(:room).permit(:member, :size, :production, :image, :category)
  end
end


