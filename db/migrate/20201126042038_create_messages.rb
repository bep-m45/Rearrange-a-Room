class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.integer :member_id
      t.text :comment

      t.timestamps
    end
  end
end
