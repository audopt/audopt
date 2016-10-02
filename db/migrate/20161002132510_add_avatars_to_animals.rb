class AddAvatarsToAnimals < ActiveRecord::Migration
  def self.up
    change_table :animals do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :animals, :avatar
  end
end
