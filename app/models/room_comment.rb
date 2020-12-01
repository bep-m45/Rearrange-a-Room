class RoomComment < ApplicationRecord
  belongs_to :member
  belongs_to :room
  
  validates :comment, length: { maximum: 100 }
end
