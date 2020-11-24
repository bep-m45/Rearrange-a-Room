class CreateRoomComments < ActiveRecord::Migration[5.2]
  def change
    create_table :room_comments do |t|
      t.integer :member_id
      t.integer :room_id
      t.string :comment

      t.timestamps
    end
  end
end
