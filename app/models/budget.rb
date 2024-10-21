class Budget < ApplicationRecord
  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :transactions, through: :accounts, dependent: :destroy
end
