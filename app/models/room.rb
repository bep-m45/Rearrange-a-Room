class Room < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :room_layout, optional: true
  belongs_to :room_genre, optional: true
  belongs_to :room_image, optional: true
  has_many :room_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  attachment :image
  
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
  
  def create_notification_like!(current_member)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and room_id = ? and action = ? ", current_member.id, member_id, id, 'favorite'])
    if temp.blank?
      notification = current_member.active_notifications.new(
        room_id: id,
        visited_id: member_id,
        action: 'favorite'
      )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
    end
  end
  
  def create_notification_room_comment!(current_member, room_comment_id)
    temp_ids = RoomComment.select(:member_id).where(room_id: id).where.not(member_id: current_member.id).distinct
    temp_ids.each do |temp_id|
      save_notification_room_comment!(current_member, room_comment_id, temp_id['member_id'])
    end
    save_notification_room_comment!(current_member, room_comment_id, member_id) if temp_ids.blank?
  end

  def save_notification_room_comment!(current_member, room_comment_id, visited_id)
    notification = current_member.active_notifications.new(
      room_id: id,
      room_comment_id: room_comment_id,
      visited_id: visited_id,
      action: 'room_comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
    
  validates :image, presence: true    
  validates :size, presence: true  
  validates :room_layout_id, presence: true
  validates :room_genre_id, presence: true  
  validates :room_image_id, presence: true
  validates :production, presence: true, length: { maximum: 250 }
end
