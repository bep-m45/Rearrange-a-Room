class HomesController < ApplicationController
  def home
    if params[:room_layout_id]
  		@room_layout = RoomLayout.find(params[:room_layout_id])
  		@room_layouts = @room_layout.rooms.order(created_at: :desc).page(params[:page])
    else
      @room_layouts = RoomLayout.page(params[:page])
    end
    
     if params[:room_genre_id]
  		@room_genre = RoomGenre.find(params[:room_genre_id])
  		@room_genres = @room_genre.rooms.order(created_at: :desc).page(params[:page])
     else
      @room_genres = RoomGenre.page(params[:page])
     end
     
      if params[:room_image_id]
  		@room_image = RoomImage.find(params[:room_image_id])
  		@room_images = @room_image.rooms.order(created_at: :desc).page(params[:page])
      else
      @room_images = RoomImage.page(params[:page])
      end
  end

  def about
  end
end
