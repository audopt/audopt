class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :content
      t.boolean :read, default: :false
      t.integer :receiver_id
      t.integer :sender_id
      t.string :kind

      t.timestamps null: false
    end
  end
end
