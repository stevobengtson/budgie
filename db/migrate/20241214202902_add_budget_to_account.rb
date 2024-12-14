class AddBudgetToAccount < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :budget, :boolean, default: true
  end
end
