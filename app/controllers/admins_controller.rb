class AdminsController < ApplicationController
before_action :authenticate_admin! 

def index
  @members = Member.all
  @rooms = Room.all
end

end