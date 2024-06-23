class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.string :memo
      t.boolean :cleared
      t.integer :amount
      t.datetime :entry_date

      t.timestamps
    end
  end
end
