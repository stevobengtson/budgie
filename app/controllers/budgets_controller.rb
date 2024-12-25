class BudgetsController < ApplicationController
  before_action :get_dates, only: [ :index ]

  # GET /budgets or /budgets.json
  def index
    # Get the budget for the current month and year
    @budget = Budget.find_by(month: @month, year: @year)
    # If the budget doesn't exist, create a new one
    @budget = BudgetService.new.find_or_create_budget(@month, @year) unless @budget
    @budget_categories = BudgetCategory.left_outer_joins(:category)
                                   .where(budget_id: @budget.id)
                                   .where('categories.is_income = ?', false)
                                   .order('categories.name ASC')

  end

  private

  def budget_params
    params.require(:budget).permit(:month, :year, :amount)
  end

  def get_dates
    if params[:date].present?
      @year = params[:date].scan(/\d{4}/).first.to_i
      @month = params[:date].scan(/\d{2}/).last.to_i
    else
      @month = params[:month]&.to_i || Date.today.month
      @year = params[:year]&.to_i || Date.today.year
    end

    # Calculate the previous and next months
    current_date = Date.new(@year, @month, 1)
    @prev_date = "%02d" % current_date.prev_month.year + "%02d" % current_date.prev_month.month
    @next_date = "%02d" % current_date.next_month.year + "%02d" % current_date.next_month.month
  end
end
