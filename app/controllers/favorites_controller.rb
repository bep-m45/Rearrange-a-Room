class FavoritesController < ApplicationController
  before_action :authenticate_member!
   
  def create
    @room = Room.find(params[:room_id])
    favorite = current_member.favorites.new(room_id: @room.id)
    favorite.save
    @room.create_notification_like!(current_member)
  end
    
  def destroy
    @room = Room.find(params[:room_id])
    favorite = current_member.favorites.find_by(room_id: @room.id)
    favorite.destroy
  end

end
