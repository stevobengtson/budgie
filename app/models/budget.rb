class Budget < ApplicationRecord
  has_many :budget_categories, dependent: :destroy
  def month_name
    Date::ABBR_MONTHNAMES[self.month]
  end

  def remaining_to_assign
    (income || 0) - (assigned || 0)
  end
end
