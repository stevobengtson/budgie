class Account < ApplicationRecord
  belongs_to :user
  belongs_to :budget
  has_many :transactions, dependent: :destroy
  monetize :balance_cents
end
