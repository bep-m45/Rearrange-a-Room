class Admins::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = Room.all.order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    @member = @room.member
    @room_comment = RoomComment.new
    @room_comments = @room.room_comments

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

    def destroy
     @room = Room.find(params[:id])
     @room_comment = RoomComment(params[:id])
     if @room.destroy
       flash[:notice] ='Roomの投稿を削除しました'
    redirect_to admins_rooms_path
     end
    end



end
