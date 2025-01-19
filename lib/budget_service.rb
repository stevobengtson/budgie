class BudgetService
  def self.calculate_budget(budget)
    new.calculate_budget(budget)
  end

  def find_or_create_budget(month, year)
    budget = Budget.where(month: month, year: year)
    return budget unless budget.empty?
    create_budget(month, year)
  end

  def create_budget(month, year)
    budget = Budget.new(month: month, year: year)
    budget.create_budget_categories
    budget.save!
    budget
  end

  def calculate_budget(budget)
    budget.update_categories
  end
end
