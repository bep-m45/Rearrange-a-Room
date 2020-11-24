class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :room
  validates :member_id, presence: true
  validates :migropost_id, presence: true
end
