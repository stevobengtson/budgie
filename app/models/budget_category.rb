class BudgetCategory < ApplicationRecord
  belongs_to :budget
  belongs_to :category

  def needed_amount
    required_amount - starting_amount - assigned_amount
  end

  def remaining_amount
    starting_amount + assigned_amount - spent_amount
  end
end
