class AddPostReferencesToAnimal < ActiveRecord::Migration
  def change
    add_reference :animals, :post, index: true, foreign_key: true
  end
end
