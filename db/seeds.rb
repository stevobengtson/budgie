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

Account.create!(name: "Checking", account_type: :checking)
Account.create!(name: "Savings", account_type: :savings)
Account.create!(name: "Credit Card", account_type: :credit_card)

500.times do
  Transaction.create!(
    account: Account.all.sample,
    amount: Faker::Number.decimal(l_digits: 2),
    description: Faker::Lorem.sentence(word_count: 3),
    entry: Faker::Date.between(from: 1.year.ago, to: Date.today),
  )
end
