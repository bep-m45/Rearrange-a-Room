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
  
  def follow(other_member)
    active_relationships.create(followed_id: other_member.id)
  end
  
  def unfollow(other_member)
    active_relation.find_by(followed_id: other_member.id).destroy
  end
  
  def following?(other_member)
    following.include?(other_member)
  end
  
end

