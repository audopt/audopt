class CreateSortByDateDescs < ActiveRecord::Migration
  def change
    create_table :sort_by_date_descs do |t|

      t.timestamps null: false
    end
  end
end
