class Room < ApplicationRecord
    belongs_to :member
    belongs_to :room_layout, optional: true
    belongs_to :room_genre, optional: true
    belongs_to :room_image, optional: true
    
    attachment :image
end

