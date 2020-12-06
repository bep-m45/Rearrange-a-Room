class CreateRoomComments < ActiveRecord::Migration[5.2]
  def change
    create_table :room_comments do |t|
      t.integer :member_id
      t.integer :room_id
      t.string :comment

      t.timestamps
      
      t.integer "parent_id", foreign_key: { to_table: :room_comments }
      t.index ["parent_id"], name: "index_room_comments_on_parent_id"
      t.index ["room_id"], name: "index_room_comments_on_room_id"
      t.index ["member_id"], name: "index_room_comments_on_member_id"
    end
  end
end
