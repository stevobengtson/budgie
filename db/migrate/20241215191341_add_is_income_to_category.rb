class AddIsIncomeToCategory < ActiveRecord::Migration[8.0]
  def change
    add_column :category, :is_income, :boolean, default: false
  end
end
