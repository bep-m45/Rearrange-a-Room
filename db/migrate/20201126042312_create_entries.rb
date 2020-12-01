class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :member_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
