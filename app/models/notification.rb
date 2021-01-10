class Notification < ApplicationRecord
default_scope -> { order(created_at: :desc) }
  belongs_to :room, optional: true
  belongs_to :room_comment, optional: true
  belongs_to :chat, optional: true
  belongs_to :message, optional: true
  belongs_to :visitor, class_name: 'Member', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'Member', foreign_key: 'visited_id', optional: true
  
end
