class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[ show edit update destroy ]

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
    unless @budget
      @budget = Budget.new(month: @month, year: @year)
      @budget.save!
    end
  end

  # GET /budgets/1 or /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets or /budgets.json
  def create
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to @budget, notice: "Budget was successfully created." }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: "Budget was successfully updated." }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy!

    respond_to do |format|
      format.html { redirect_to budgets_path, status: :see_other, notice: "Budget was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.expect(budget: [ :month, :year, :income, :assigned ])
    end
end
