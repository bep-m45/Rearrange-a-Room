class MembersController < ApplicationController
  before_action :authenticate_member!


  def show

  end

  def edit

  end

  def update
   current_member.update(member_params)
   redirect_to members_path(current_member)

  end

  def create

  end


  def index
  end

   private
  def member_params
  params.require(:member).permit(:name, :nickname, :email, :profile_image, :profile )
  end
end


