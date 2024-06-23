module TransactionsHelper
  def account_options
    current_user.accounts.map { |account| [account.name, account.id] }
  end

  def transaction_type(transaction)
    if transaction.amount < 0
      'expense'
    else
      'income'
    end
  end

  def transaction_amount(transaction)
    number_to_currency(transaction.amount)
  end

  def transaction_date(transaction)
    transaction.entry_date.strftime('%B %d, %Y')
  end
end
