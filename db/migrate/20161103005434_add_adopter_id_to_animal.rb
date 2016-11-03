class AddAdopterIdToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :adopter_id, :integer
  end
end
