class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :singleton_guard
      t.integer :qtd, default: 0

      t.timestamps null: false
    end
	add_index(:pets, :singleton_guard, :unique => true)
  end
end
