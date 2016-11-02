class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :content
      t.boolean :read, default: :false
      t.integer :receiver_id

      t.timestamps null: false
    end
  end
end
