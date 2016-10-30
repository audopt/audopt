class CreateSortByDateAscs < ActiveRecord::Migration
  def change
    create_table :sort_by_date_ascs do |t|

      t.timestamps null: false
    end
  end
end
