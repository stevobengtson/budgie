class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :atype
      t.string :currency
      t.monetize :balance
      t.decimal :interest_rate, precision: 5, scale: 2
      t.timestamp :opened_at
      t.timestamp :closed_at, null: true

      t.timestamps
    end
  end
end
