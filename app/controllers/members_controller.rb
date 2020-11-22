class MembersController < ApplicationController
  before_action :authenticate_member!
   def index
     @members = Member.all
   end

  def show
   @member = Member.find(params[:id])
   @rooms = current_member.rooms
  
   


  end

  def edit
   @member = Member.find(params[:id])

  end

  def update
   @member = Member.find(params[:id])
   @member.update(member_params)
   redirect_to member_path(@member.id)
  end

  def create

  end
  
  def following
   @member  = Member.find(params[:id])
   @members = @member.following.paginate(page: params[:page])
   render 'following'
  end
 
 
 def followers
    @member  = Member.find(params[:id])
    @members = @member.followers.paginate(page: params[:page])
    render 'followers'
 end

   private
  def member_params
  params.require(:member).permit(:name, :nickname, :email, :profile_image, :profile )
  end
end


