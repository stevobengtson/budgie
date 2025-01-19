class AddUserToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_reference :accounts, :user, null: true, foreign_key: true
    user = User.first
    Account.update_all(user_id: user.id)
    change_column_null :accounts, :user_id, false
  end
end
