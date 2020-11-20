class MembersController < ApplicationController
  before_action :authenticate_member!
   def index
   end

  def show
   @member = Member.find(params[:id])

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
  end
 

   private
  def member_params
  params.require(:member).permit(:name, :nickname, :email, :profile_image, :profile )
  end
end


