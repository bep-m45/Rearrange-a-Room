class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :room
  validates :member_id, presence: true
  validates :room_id, presence: true
end
