class CreateRoomImages < ActiveRecord::Migration[5.2]
  def change
    create_table :room_images do |t|
      t.string :image_name

      t.timestamps
    end
  end
end
