class Room < ApplicationRecord
    belongs_to :member
    belongs_to :category, optional: true
    attachment :image
end

