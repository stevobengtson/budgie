class UpdateDecimalPercisions < ActiveRecord::Migration[8.0]
  def up
    add_column :accounts, :balance, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :transactions, :amount, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :budget_categories, :starting_amount, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :budget_categories, :assigned_amount, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :budget_categories, :required_amount, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :budget_categories, :spent_amount, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :budgets, :income, :decimal, precision: 12, scale: 2, default: 0.0
    change_column :budgets, :assigned, :decimal, precision: 12, scale: 2, default: 0.0
  end

  def down
    change_column :transactions, :amount, :decimal
    change_column :budget_categories, :starting_amount, :decimal
    change_column :budget_categories, :assigned_amount, :decimal
    change_column :budget_categories, :required_amount, :decimal
    change_column :budget_categories, :spent_amount, :decimal
    change_column :budgets, :income, :decimal
    change_column :budgets, :assigned, :decimal
  end
end
