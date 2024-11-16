class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.date :entry
      t.text :description
      t.decimal :amount

      t.timestamps
    end
  end
end
