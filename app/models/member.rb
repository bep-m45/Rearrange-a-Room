class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :rooms, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites, dependent: :destroy
  has_many :room_comments, dependent: :destroy
  has_many :reply_comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entres, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.name = "ゲスト会員"
      member.nickname = "ゲスト"
      member.password = SecureRandom.urlsafe_base64
    end
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def follow(other_member)
      active_relationships.create(followed_id: other_member.id)
  end

  def unfollow(other_member)
      active_relationships.find_by(followed_id: other_member.id).destroy
  end

  def following?(other_member)
      following.include?(other_member)
  end
  
  def create_notification_follow!(current_member)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_member.id, id, 'follow'])
    if temp.blank?
      notification = current_member.active_notifications.new(
      visited_id: id,
      action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  
  validates :nickname, presence: true, length: { minimum: 2, maximum: 10 }
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :profile, length: { maximum: 250 }
end

