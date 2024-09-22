class Transaction < ApplicationRecord
  belongs_to :account
  monetize :amount_cents
end
