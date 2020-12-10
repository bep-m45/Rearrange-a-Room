class RoomLayout < ApplicationRecord
  has_many :rooms, dependent: :destroy   
end
