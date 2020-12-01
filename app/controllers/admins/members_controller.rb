class Admins::MembersController < ApplicationController
    before_action :authenticate_admin! 

  def index
    @members = Member.all
  end

  def edit
   @member = Member.find(params[:id])
  end
  
   def update
        @member = Member.find(params[:id])
        if @member.update(member_params)
            flash[:notice] = "お客様情報を更新しました"
            redirect_to admins_members_path
        else
            render 'admins/members/edit'
        end
   end
  
   private
   
  def member_params
  params.require(:member).permit(:is_deleted )
  end
 end
