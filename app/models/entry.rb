class Entry < ApplicationRecord
  belongs_to :member
  belongs_to :chat
end
