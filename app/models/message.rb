class Message < ApplicationRecord
  belongs_to :member
  belongs_to :chat
  
  validates :comment, length: { maximum:  }
end
