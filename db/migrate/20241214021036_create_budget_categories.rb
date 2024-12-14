class CreateBudgetCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :budget_categories do |t|
      t.references :budget, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.decimal :starting_amount
      t.decimal :assigned_amount
      t.decimal :required_amount
      t.decimal :spent_amount

      t.timestamps
    end
  end
end
