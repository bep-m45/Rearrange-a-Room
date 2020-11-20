class RelationshipsController < ApplicationController
  def create
    member = member.find(params[:followed_id])
    current_member.follow(member)
    redirect_to member
  end
  
  def destroy
    member = Relationship.find(params[:id]).followed
    current_member.unfollow(member)
    redirect_to member
  end

end