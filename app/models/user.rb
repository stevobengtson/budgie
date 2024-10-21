class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :accounts, through: :budgets, dependent: :destroy
  has_many :transactions, through: :accounts, dependent: :destroy
  has_many :budgets, dependent: :destroy
end
