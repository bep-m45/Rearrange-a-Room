class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :item_id
      t.string :category_name
      t.string :room_layout_name
      t.string :room_image_name
      t.string :room_genre_name
      t.string :ancestry, index: true
      t.timestamps
    end
  end
end
