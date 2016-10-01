class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :user
			t.text :reason
			t.integer :sender

      t.timestamps null: false
    end
  end
end
