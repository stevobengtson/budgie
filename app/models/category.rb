class Category < ApplicationRecord
  belongs_to :category_group
  has_many :transactions

  def can_delete?
    !category_group.is_income? || category_group.categories.count > 1
  end

  def sum_transactions_for_budget(budget)
    transactions.where(
      "to_char(entry, 'MM') = ? AND to_char(entry, 'YYYY') = ?",
      *budget.month_year
    )
    .sum(:amount)
  end
end
