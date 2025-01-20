class AddUserToCategoryGroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :category_groups, :user, null: true, foreign_key: true
    CategoryGroup.update_all(user_id: User.first.id)
    change_column_null :category_groups, :user_id, false
  end
end
