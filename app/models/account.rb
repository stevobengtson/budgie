class Account < ApplicationRecord
  enum :account_type, [ :checking, :savings, :credit_card ]
  has_many :transactions, dependent: :destroy
end
