class RoomImage < ApplicationRecord
  has_many :rooms, dependent: :destroy   
end
