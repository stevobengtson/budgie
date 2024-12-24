class BudgetsController < ApplicationController
  # GET /budgets or /budgets.json
  def index
    # Calculate the current month and year, unless supplied by params 'month', 'year'
    @month = params[:month]&.to_i || Date.today.month
    @year = params[:year]&.to_i || Date.today.year

    # Calculate the previous and next months
    current_date = Date.new(@year, @month, 1)
    @prev_month = current_date.prev_month.month
    @prev_year = current_date.prev_month.year
    @next_month = current_date.next_month.month
    @next_year = current_date.next_month.year

    @budget = BudgetService.new.find_or_create_budget(@month, @year)
    @budget_categories = BudgetCategory.left_outer_joins(:category)
                                       .where(budget_id: @budget.id)
                                       .where('categories.is_income = ?', false)
                                       .order('categories.name ASC')

  end
end
