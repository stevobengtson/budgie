class Budget < ApplicationRecord
  has_many :budget_categories, dependent: :destroy
  def month_name
    Date::ABBR_MONTHNAMES[self.month]
  end

  def remaining_to_assign
    income - assigned
  end
end
