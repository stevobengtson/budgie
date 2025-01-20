class CategoryGroup < ApplicationRecord
  has_many :categories
  has_many :transactions, through: :categories
  belongs_to :user
end
