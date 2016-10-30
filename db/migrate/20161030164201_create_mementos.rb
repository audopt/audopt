class CreateMementos < ActiveRecord::Migration
  def change
    create_table :mementos do |t|
			t.belongs_to :article	
      t.string :title
      t.text :description
      t.text :content

      t.timestamps null: false
    end
  end
end
