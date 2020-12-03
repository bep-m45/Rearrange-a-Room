class RoomComment < ApplicationRecord
  belongs_to :member
  belongs_to :room
   belongs_to :parent, class_name: "RoomComment", optional: true
   has_many   :replies, class_name: "RoomComment", foreign_key: :parent_id, dependent: :destroy
  validates :comment, length: { maximum: 100 }
end
