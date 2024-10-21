# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clean up the database
p "Cleaning up the database"
Transaction.destroy_all
Account.destroy_all
Budget.destroy_all
User.destroy_all
p "Cleaned up the database"

p "Creating test user"
user = User.create!(
  email: 'steven.bengtson@me.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Steven Bengtson',
  confirmed_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
  confirmation_token: nil,
)
p "Created user: #{user.email}"

p "Creating second test user"
User.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Test User',
  confirmed_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
  confirmation_token: nil,
)
p "Created user: #{User.last.email}"

p "Creating test budgets"
10.times do |i|
  Budget.create!(
    user: User.all.sample,
    title: Faker::Company.name,
  )
end
p "Created #{Budget.count} budgets"

p "Creating test accounts"
100.times do |i|
  Account.create!(
    user: User.all.sample,
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    atype: %w[Checking Savings Credit].sample,
    balance_cents: Faker::Number.number(digits: 6),
    interest_rate: Faker::Number.decimal(l_digits: 2),
    opened_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
    budget: Budget.all.sample,
  )
end
p "Created #{Account.count} accounts"

p "Creating test transactions"
1000.times do |i|
  Transaction.create!(
    account: Account.all.sample,
    memo: Faker::Company.catch_phrase,
    cleared: [ true, false ].sample,
    amount_cents: Faker::Number.number(digits: 6),
    entry_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
  )
end
p "Created #{Transaction.count} transactions"
