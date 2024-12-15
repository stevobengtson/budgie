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
Budget.destroy_all
BudgetCategory.destroy_all

# Create the data
puts "Creating Accounts..."
Account.create!(name: "Checking", account_type: :checking)
Account.create!(name: "Savings", account_type: :savings)
Account.create!(name: "Visa", account_type: :credit_card)
Account.create!(name: "Credit Line", account_type: :credit_line)
Account.create!(name: "Car Loan", account_type: :loan)
Account.create!(name: "Cash", account_type: :cash)

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
categories = []
categories << Category.create!(name: "Paycheck", category_group: CategoryGroup.find_by(name: "Income"), is_income: true)
categories << Category.create!(name: "Bonus", category_group: CategoryGroup.find_by(name: "Income"), is_income: true)
categories << Category.create!(name: "Interest", category_group: CategoryGroup.find_by(name: "Income"), is_income: true)
categories << Category.create!(name: "Rent", category_group: CategoryGroup.find_by(name: "Home"))
categories << Category.create!(name: "Mortgage", category_group: CategoryGroup.find_by(name: "Home"))
categories << Category.create!(name: "Property Taxes", category_group: CategoryGroup.find_by(name: "Home"))
categories << Category.create!(name: "Home Insurance", category_group: CategoryGroup.find_by(name: "Home"))
categories << Category.create!(name: "Auto Insurance", category_group: CategoryGroup.find_by(name: "Auto"))
categories << Category.create!(name: "Gas", category_group: CategoryGroup.find_by(name: "Auto"))
categories << Category.create!(name: "Car Payment", category_group: CategoryGroup.find_by(name: "Auto"))
categories << Category.create!(name: "Electric", category_group: CategoryGroup.find_by(name: "Utilities"))
categories << Category.create!(name: "Water", category_group: CategoryGroup.find_by(name: "Utilities"))
categories << Category.create!(name: "Trash", category_group: CategoryGroup.find_by(name: "Utilities"))
categories << Category.create!(name: "Groceries", category_group: CategoryGroup.find_by(name: "Essentials"))
categories << Category.create!(name: "Cell Phone", category_group: CategoryGroup.find_by(name: "Essentials"))
categories << Category.create!(name: "Internet", category_group: CategoryGroup.find_by(name: "Essentials"))
categories << Category.create!(name: "Cable", category_group: CategoryGroup.find_by(name: "Entertainment"))
categories << Category.create!(name: "Netflix", category_group: CategoryGroup.find_by(name: "Subscriptions"))
categories << Category.create!(name: "Hulu", category_group: CategoryGroup.find_by(name: "Subscriptions"))
categories << Category.create!(name: "Gym", category_group: CategoryGroup.find_by(name: "Health"))
categories << Category.create!(name: "Doctor", category_group: CategoryGroup.find_by(name: "Health"))
categories << Category.create!(name: "Medication", category_group: CategoryGroup.find_by(name: "Health"))
categories << Category.create!(name: "Miscellaneous", category_group: CategoryGroup.find_by(name: "Miscellaneous"))

puts "Creating Budgets..."
current_date = Date.today
next_date = current_date.next_month
prev_date = current_date.prev_month

prev_month = prev_date.month
prev_year = prev_date.year
prev_budget = Budget.create!(month: prev_month, year: prev_year, income: Faker::Number.decimal(l_digits: 2), assigned: Faker::Number.decimal(l_digits: 2))
current_month = current_date.month
current_year = current_date.year
current_budget = Budget.create!(month: current_month, year: current_year, income: Faker::Number.decimal(l_digits: 2), assigned: Faker::Number.decimal(l_digits: 2))
next_month = next_date.month
next_year = next_date.year
next_budget = Budget.create!(month: next_month, year: next_year, income: Faker::Number.decimal(l_digits: 2), assigned: Faker::Number.decimal(l_digits: 2))

puts "Creating Budget Categories..."
for category in categories
  puts "Creating Budget Category for #{category.name}..."
  BudgetCategory.create!(
    budget: prev_budget,
    category: category,
    starting_amount: Faker::Number.decimal(l_digits: 2),
    assigned_amount: Faker::Number.decimal(l_digits: 2),
    required_amount: Faker::Number.decimal(l_digits: 2),
    spent_amount: Faker::Number.decimal(l_digits: 2),
  )
  BudgetCategory.create!(
    budget: current_budget,
    category: category,
    starting_amount: Faker::Number.decimal(l_digits: 2),
    assigned_amount: Faker::Number.decimal(l_digits: 2),
    required_amount: Faker::Number.decimal(l_digits: 2),
    spent_amount: Faker::Number.decimal(l_digits: 2),
  )
  BudgetCategory.create!(
    budget: next_budget,
    category: category,
    starting_amount: Faker::Number.decimal(l_digits: 2),
    assigned_amount: Faker::Number.decimal(l_digits: 2),
    required_amount: Faker::Number.decimal(l_digits: 2),
    spent_amount: Faker::Number.decimal(l_digits: 2),
  )
end

puts "Creating Transactions..."
1000.times do
  Transaction.create!(
    account: Account.all.sample,
    category: Category.all.sample,
    amount: Faker::Number.decimal(l_digits: 2),
    description: Faker::Lorem.sentence(word_count: 3),
    entry: Faker::Date.between(from: prev_date.beginning_of_month, to: current_date),
  )
end
