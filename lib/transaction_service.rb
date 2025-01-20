class TransactionService
  class << self
    def create_transaction(params)
      category = Category.find(params[:category_id])
      account = Account.find(params[:account_id])

      entry_date = Date.parse(params[:entry])
      month = entry_date.month
      year = entry_date.year

      budget = BudgetService.find_or_create_budget(month, year)
      budget_category = BudgetCategory.find_by(budget: budget, category: category)

      transaction = Transaction.new(amount: amount, category: category, budget: budget)
      transaction.save!

      account.update!(balance: account.transactions.sum(:amount))
      budget_category.update!(amount: budget_category.transactions.sum(:amount))

      transaction
    end
  end
end
