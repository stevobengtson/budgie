class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[ edit update destroy ]

  # GET /budgets or /budgets.json
  def index
    @budgets = current_user.budgets.all
  end

  # GET /budgets/new
  def new
    @budget = current_user.budgets.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  def create
    @budget = current_user.budgets.new(budget_params)
    if @budget.save
      redirect_to budgets_url, notice: "Budget was successfully created budget."
    else
      redirect_to budgets_url, alert: "Unable to create budget."
    end
  end

  # PATCH/PUT /budgets/1
  def update
    if @budget.update(budget_params)
      redirect_to budgets_url, notice: "Budget was successfully updated."
    else
      redirect_to budgets_url, alert: "Budget was not updated."
    end
  end

  # DELETE /budgets/1
  def destroy
    @budget.destroy!
    redirect_to budgets_url, notice: "Budget was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget
    @budget = Budget.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def budget_params
    params.require(:budget).permit(:title)
  end
end
