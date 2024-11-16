class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :category_group, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :transactions, :category, null: false, foreign_key: true
  end
end
