class RelationshipsController < ApplicationController
  before_action :authenticate_member!
  
  def create
    @member = Member.find(params[:followed_id])
    current_member.follow(@member)
    @member.create_notification_follow!(current_member)
    redirect_to @member
  end
    
  def destroy
  @member = Relationship.find(params[:id]).followed
  current_member.unfollow(@member)
  redirect_to @member
  end

end