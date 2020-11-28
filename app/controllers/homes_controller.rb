class HomesController < ApplicationController
  def home
   
     @all_ranks = Room.joins(:favorites).where(favorites: {created_at: Time.now.all_month}).group(:id).order('count(favorites.room_id) desc').limit(6)
   
    if params[:room_layout_id]
  		@room_layout = RoomLayout.find(params[:room_layout_id])
  		@room_layouts = @room_layout.rooms.order(created_at: :desc)
    else
      @room_layouts = RoomLayout
    end
    
     if params[:room_genre_id]
  		@room_genre = RoomGenre.find(params[:room_genre_id])
  		@room_genres = @room_genre.rooms.order(created_at: :desc)
     else
      @room_genres = RoomGenre
     end
     
      if params[:room_image_id]
  		@room_image = RoomImage.find(params[:room_image_id])
  		@room_images = @room_image.rooms.order(created_at: :desc)
      else
        @room_images = RoomImage
      end
  end

  def about
  end
end
