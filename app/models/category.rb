class Category < ApplicationRecord
  has_many :items
  as_ancestry
end
