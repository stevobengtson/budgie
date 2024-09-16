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
User.destroy_all
p "Cleaned up the database"

# Create a test user
User.create!(
  email: 'steven.bengtson@me.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Steven Bengtson',
  confirmed_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
  confirmation_token: nil,
)

p "Created user: #{User.first.email}"

# Create test accounts
100.times do |i|
  Account.create!(
    user: User.first,
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    atype: %w[Checking Savings Credit].sample,
    currency: %w[USD EUR GBP].sample,
    balance: Faker::Number.decimal(l_digits: 5),
    interest_rate: Faker::Number.decimal(l_digits: 2),
    opened_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
  )
end
p "Created #{Account.count} accounts"

# Create test transactions
1000.times do |i|
  Transaction.create!(
    account: Account.all.sample,
    memo: Faker::Company.catch_phrase,
    cleared: [ true, false ].sample,
    amount: Faker::Number.decimal(l_digits: 5),
    entry_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
  )
end
p "Created #{Transaction.count} transactions"
