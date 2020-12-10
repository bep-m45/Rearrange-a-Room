class SearchesController < ApplicationController
  
def search
  @range = params[:range]
  @word = params[:word]
  if @range == "1"
     @members = Member.where('nickname like ? or profile like ?', "%#{@word}%", "%#{@word}%")
  elsif @range == "2"
     @rooms = Room.where('production like ? or size like ?', "%#{@word}%", "%#{@word}%")
  end
end

end
