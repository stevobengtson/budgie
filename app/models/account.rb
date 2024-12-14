class Account < ApplicationRecord
  enum :account_type, [ :checking, :savings, :credit_card, :cash, :loan, :credit_line ]
  has_many :transactions, dependent: :destroy
end
