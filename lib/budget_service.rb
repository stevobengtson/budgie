class BudgetService
  def find_or_create_budget(month, year)
    budget = Budget.find_by(month: month, year: year)
    create_budget_categories(budget, Category.where(is_income: false)) and budget.save! if budget
    budget || create_budget(month, year)
  end

  def create_budget(month, year)
    budget = Budget.new(month: month, year: year)
    create_budget_categories(budget, Category.where(is_income: false))
    budget.save!
    budget
  end

  def create_budget_categories(budget, categories)
    return unless budget.budget_categories.empty?
    categories.each do |category|
      budget.budget_categories.build(
        budget: budget,
        category: category,
        starting_amount: 0.00,
        assigned_amount: 0.00,
        required_amount: 0.00,
        spent_amount: 0.00
      )
    end
  end

  def calculate_budget(budget)
    budget.budget_categories.each do |budget_category|
      budget_category.spent_amount = calculate_spent_amount(budget, budget_category.category)
      budget_category.save!
    end
  end

  private

  def calculate_spent_amount(budget, category)
    category.transactions
            .where(
              "strftime('%m', entry) = ? AND strftime('%Y', entry) = ?",
              format("%02d", budget.month),
              budget.year.to_s
            )
            .sum(:amount)
  end
end
