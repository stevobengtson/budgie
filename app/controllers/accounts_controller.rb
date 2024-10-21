class AccountsController < ApplicationController
  before_action :set_budget, only: %i[ index new create ]
  before_action :set_account, only: %i[ edit update destroy ]
  before_action :default_sort, only: %i[ index ]

  # GET /budgets/:budget_id/accounts
  def index
    @pagy, @accounts = pagy(@budget.accounts.order("#{params[:sort]} #{params[:direction]}"), items: 25)
  end

  # GET /budgets/:budget_id/accounts/new
  def new
    @account = @budget.accounts.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /budgets/:budget_id/accounts
  def create
    @account = @budget.accounts.new(account_params)
    if @account.save
      redirect_to budget_accounts_url(@account.budget), notice: "Account was successfully created."
    else
      redirect_to budget_accounts_url(@account.budget), notice: "Account was not created."
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to budget_accounts_url(@account.budget), notice: "Account was successfully updated."
    else
      redirect_to budget_accounts_url(@account.budget), notice: "Account was not updated."
    end
  end

  # DELETE /accounts/1
  def destroy
    budget = @account.budget
    @account.destroy!
    redirect_to budget_accounts_url(budget), notice: "Account was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  def set_budget
    @budget = Budget.find(params[:budget_id])
  end

  def default_sort
    if params[:sort].blank?
      params[:sort] = "created_at"
      params[:direction] = "desc"
    end
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :description, :atype, :currency, :balance, :interest_rate, :opened_at, :closed_at)
  end
end
