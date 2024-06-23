class Account < ApplicationRecord
  enum account_type: { checking: 0, savings: 1, credit: 2, loan: 3, line_of_credit: 4 }
  belongs_to :user
  has_many :transactions
end
