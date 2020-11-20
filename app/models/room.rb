class Room < ApplicationRecord
    belongs_to :member
    belongs_to :category
    attachment :image
end
