class CreateSortTemplates < ActiveRecord::Migration
  def change
    create_table :sort_templates do |t|

      t.timestamps null: false
    end
  end
end
