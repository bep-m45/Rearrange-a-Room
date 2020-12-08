class Room < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :room_layout, optional: true
  belongs_to :room_genre, optional: true
  belongs_to :room_image, optional: true
  has_many :room_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
    
  validates :image, presence: true    
  validates :size, presence: true  
  validates :room_layout_id, presence: true
  validates :room_genre_id, presence: true  
  validates :room_image_id, presence: true
  validates :production, presence: true, length: { maximum: 250 }
end
