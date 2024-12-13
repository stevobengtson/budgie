# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

# Clear out all the data
Transaction.destroy_all
Account.destroy_all
Category.destroy_all
CategoryGroup.destroy_all

# Create the data
puts "Creating Accounts..."
Account.create!(name: "Checking", account_type: :checking)
Account.create!(name: "Savings", account_type: :savings)
Account.create!(name: "Credit Card", account_type: :credit_card)

puts "Creating Categories Groups..."
CategoryGroup.create!(name: "Income")
CategoryGroup.create!(name: "Debt")
CategoryGroup.create!(name: "Home")
CategoryGroup.create!(name: "Auto")
CategoryGroup.create!(name: "Utilities")
CategoryGroup.create!(name: "Essentials")
CategoryGroup.create!(name: "Entertainment")
CategoryGroup.create!(name: "Subscriptions")
CategoryGroup.create!(name: "Health")
CategoryGroup.create!(name: "Miscellaneous")

puts "Creating Categories..."
Category.create!(name: "Paycheck", category_group: CategoryGroup.find_by(name: "Income"))
Category.create!(name: "Bonus", category_group: CategoryGroup.find_by(name: "Income"))
Category.create!(name: "Interest", category_group: CategoryGroup.find_by(name: "Income"))
Category.create!(name: "Rent", category_group: CategoryGroup.find_by(name: "Home"))
Category.create!(name: "Mortgage", category_group: CategoryGroup.find_by(name: "Home"))
Category.create!(name: "Property Taxes", category_group: CategoryGroup.find_by(name: "Home"))
Category.create!(name: "Home Insurance", category_group: CategoryGroup.find_by(name: "Home"))
Category.create!(name: "Auto Insurance", category_group: CategoryGroup.find_by(name: "Auto"))
Category.create!(name: "Gas", category_group: CategoryGroup.find_by(name: "Auto"))
Category.create!(name: "Car Payment", category_group: CategoryGroup.find_by(name: "Auto"))
Category.create!(name: "Electric", category_group: CategoryGroup.find_by(name: "Utilities"))
Category.create!(name: "Water", category_group: CategoryGroup.find_by(name: "Utilities"))
Category.create!(name: "Trash", category_group: CategoryGroup.find_by(name: "Utilities"))
Category.create!(name: "Groceries", category_group: CategoryGroup.find_by(name: "Essentials"))
Category.create!(name: "Cell Phone", category_group: CategoryGroup.find_by(name: "Essentials"))
Category.create!(name: "Internet", category_group: CategoryGroup.find_by(name: "Essentials"))
Category.create!(name: "Cable", category_group: CategoryGroup.find_by(name: "Entertainment"))
Category.create!(name: "Netflix", category_group: CategoryGroup.find_by(name: "Subscriptions"))
Category.create!(name: "Hulu", category_group: CategoryGroup.find_by(name: "Subscriptions"))
Category.create!(name: "Gym", category_group: CategoryGroup.find_by(name: "Health"))
Category.create!(name: "Doctor", category_group: CategoryGroup.find_by(name: "Health"))
Category.create!(name: "Medication", category_group: CategoryGroup.find_by(name: "Health"))
Category.create!(name: "Miscellaneous", category_group: CategoryGroup.find_by(name: "Miscellaneous"))

puts "Creating Budgets..."
current_date = Date.today
next_date = current_date.next_month
prev_date = current_date.prev_month

prev_month = prev_date.month
prev_year = prev_date.year
Budget.create!(month: prev_month, year: prev_year, income: 0, assigned: 0)
current_month = current_date.month
current_year = current_date.year
Budget.create!(month: current_month, year: current_year, income: 0, assigned: 0)
next_month = next_date.month
next_year = next_date.year
Budget.create!(month: next_month, year: next_year, income: 0, assigned: 0)

puts "Creating Transactions..."
500.times do
  Transaction.create!(
    account: Account.all.sample,
    category: Category.all.sample,
    amount: Faker::Number.decimal(l_digits: 2),
    description: Faker::Lorem.sentence(word_count: 3),
    entry: Faker::Date.between(from: prev_date.beginning_of_month, to: current_date),
  )
end
