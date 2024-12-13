class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.integer :month
      t.integer :year
      t.decimal :income
      t.decimal :assigned

      t.timestamps
    end
  end
end
