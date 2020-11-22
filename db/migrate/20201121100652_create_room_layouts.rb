class CreateRoomLayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :room_layouts do |t|
      t.string :layout_name

      t.timestamps
    end
  end
end
