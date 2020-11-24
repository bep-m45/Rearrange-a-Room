class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :member_id, null: false
      t.integer :room_id, null: false

      t.timestamps
      
      t.index :member_id
      t.index :room_id
      t.index [:member_id, :room_id], unique: true
     
    end
  end
end
