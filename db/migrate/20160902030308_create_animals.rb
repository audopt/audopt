class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :kind
      t.string :breed
      t.boolean :vaccined
      t.boolean :castrated
      t.string :sex
      t.string :size

      t.timestamps null: false
    end
  end
end
