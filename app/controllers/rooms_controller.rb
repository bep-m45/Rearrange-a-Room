class RoomsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :show, :edit]

  def index
    if params[:room_layout_id]
	     @room_layout = RoomLayout.find(params[:room_layout_id])
		   @rooms = @room_layout.rooms.order(created_at: :desc).page(params[:page]).per(9)
	  elsif params[:room_genre_id]
	     @room_genre = RoomGenre.find(params[:room_genre_id])
		   @rooms = @room_genre.rooms.order(created_at: :desc).page(params[:page]).per(9)
	  elsif params[:room_image_id]
		   @room_image = RoomImage.find(params[:room_image_id])
		   @rooms = @room_image.rooms.order(created_at: :desc).page(params[:page]).per(9)
    else
       @rooms = Room.all.order(created_at: :desc).page(params[:page]).per(9)
    end
  end

  def new
     @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.member_id = current_member.id

  if @room.save
     redirect_to room_path(@room.id)
     flash[:notice] = "Roomを投稿しました"
  else
     render "new", notice: "送信に失敗しましたしました"
  end
  end

  def show
    @room = Room.find(params[:id])
    @room_comments = @room.room_comments
    @room_comment = @room.room_comments.build
    @room_comment_reply = @room.room_comments.build
    @member = @room.member

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

    if @room.member.id != current_member.id
    redirect_to member_path(current_member.id)
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      byebug
       flash[:notice] = "Roomが編集されました"
       redirect_to member_path(current_member.id)
    else
       flash[:notice] ='ROOMの編集に失敗しました'
       render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])

    if @room.destroy
       flash[:notice] ='Roomの投稿を削除しました'
       redirect_to member_path(current_member)
    end
  end

  private

  def set_room
    @room = Room.find.(params[:id])
  end

  def room_params
    params.require(:room).permit(:member_id, :size, :production, :image,  :room_layout_id, :room_genre_id, :room_image_id)
  end
end


