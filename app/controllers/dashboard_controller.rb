class DashboardController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboard
  def index
    # This one will show the initial dashboard, for now just show a friendly message
    # We need the Accounts for this user (use the dashboard_helper?), this goes to a sidebar, can we make a component?
    # They need to click on an account and we can show the transactions for it
    # We also need to be able to show the transactions for all the accounts
    # Later we will add other dashboard screens like budgets, reports etc
    render
  end

  # GET /dashboard/transactions
  def transactions
    # This will show the transactions for the selected account, or all accounts if none is selected
    # We need to show the transactions in a table, with a filter to search for a specific transaction
    # We also need to be able to add a new transaction
    render
  end

  # GET /dashboard/budget
  def budget
    # This will show the budget for the user
    render
  end
end
