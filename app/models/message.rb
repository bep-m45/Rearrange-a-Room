class Message < ApplicationRecord
  belongs_to :member
  belongs_to :chat
  #has_many :notifications, dependent: :destroy
  validates :comment, presence: true, length: { maximum: 300 }
end
