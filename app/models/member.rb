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

   def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.name = "ゲスト会員"
      member.nickname = "ゲスト"
      member.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
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

  validates :nickname, presence: true, length: { minimum: 3, maximum: 10 }
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :profile, length: { maximum: 250 }

end

