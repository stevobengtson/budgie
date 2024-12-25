class BudgetService
  def find_or_create_budget(month, year)
    budget = Budget.where(month: month, year: year)
    return budget unless budget.empty?

    ActiveRecord::Base.transaction do
      budget = Budget.create!(month: month, year: year)
      create_category_entries(budget)
    end

    budget
  end

  def create_category_entries(budget)
    Category.find_each do |category|
      BudgetCategory.create!(
        budget: budget,
        category: category,
        starting_amount: 0, # TODO: Pull this from the previous month
        assigned_amount: 0,
        required_amount: 0, # Budget
        spent_amount: 0, # TODO: Pull this from the transactions for this month
      )
    end
  end
end
