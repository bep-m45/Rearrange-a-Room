class RoomsController < ApplicationController
  def index
    
      if params[:room_layout_id]
		  @room_layout = RoomLayout.find(params[:room_layout_id])
		  @rooms = @room_layout.rooms.order(created_at: :desc)
		  elsif params[:room_genre_id]
		  @room_genre = RoomGenre.find(params[:room_genre_id])
		    @rooms = @room_genre.rooms.order(created_at: :desc)
		  elsif params[:room_image_id]
		    @room_image = RoomImage.find(params[:room_image_id])
		    @rooms = @room_image.rooms.order(created_at: :desc)
      else
        @rooms = Room.all
      end
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


