class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :member, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
      t.index [:member_id, :room_id], unique: true
    end
  end
end
