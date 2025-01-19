class Budget < ApplicationRecord
  has_many :budget_categories, dependent: :destroy

  def month_name
    Date::ABBR_MONTHNAMES[self.month]
  end

  def month_year
    [ format("%02d", month), year.to_s ]
  end

  def remaining_to_assign
    (income || 0) - (assigned || 0)
  end

  def create_budget_categories
    return unless budget_categories.empty?
    Category.where(is_income: false).each do |category|
      budget_categories.build(
        category: category,
        starting_amount: 0.00,
        assigned_amount: 0.00,
        required_amount: 0.00,
        spent_amount: 0.00
      )
    end
  end

  def update_categories
    budget_categories.each do |budget_category|
      budget_category.update_category(budget_category.category)
    end
  end
end
