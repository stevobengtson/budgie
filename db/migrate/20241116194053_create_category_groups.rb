class CreateCategoryGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :category_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
