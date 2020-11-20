class Category < ApplicationRecord
  has_many :items
  has_many :rooms, dependent: :destroy   
  has_ancestry
end
