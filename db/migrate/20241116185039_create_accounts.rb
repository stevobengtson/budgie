class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :account_type

      t.timestamps
    end

    add_reference :transactions, :account, foreign_key: true
  end
end
