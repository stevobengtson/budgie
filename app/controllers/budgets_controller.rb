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
    # Get the budget for the current month and year
    @budget = Budget.find_by(month: @month, year: @year)
    # If the budget doesn't exist, create a new one
    @budget = Budget::Budget.new_budget(@month, @year) unless @budget
  end
end
