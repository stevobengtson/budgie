class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  scope :for_account, ->(account_id = 0) { where(account_id: account_id) if account_id != 0 }

  after_commit :update_account_balance

  private

  def update_account_balance
    account.update!(balance: account.transactions.sum(:amount))
  end
end
