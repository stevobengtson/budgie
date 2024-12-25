class AddIsIncomeToCategoryGroup < ActiveRecord::Migration[8.0]
  def change
    add_column :category_groups, :is_income, :boolean, default: false, null: false
  end
end
