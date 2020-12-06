class Message < ApplicationRecord
  belongs_to :member
  belongs_to :chat

  validates :comment, presence: true, length: { maximum: 150 }
end
