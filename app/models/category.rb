class Category < ApplicationRecord
  belongs_to :category_group
  has_many :transactions

  def can_delete?
    !category_group.is_income? || category_group.categories.count > 1
  end
end
