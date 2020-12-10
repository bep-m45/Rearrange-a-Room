class RoomGenre < ApplicationRecord
  has_many :rooms, dependent: :destroy   
end
