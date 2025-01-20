namespace :budgie do
  desc "Manage test data"

  task clear: :environment do
    puts "Clearing all data..."
    Transaction.destroy_all
    Account.destroy_all
    Budget.destroy_all
    BudgetCategory.destroy_all
    Category.destroy_all
    CategoryGroup.destroy_all
    User.destroy_all
  end

  task seed: :environment do
    Rake::Task["budgie:clear"].invoke

    puts "Creating a user..."
    user = User.create!(email_address: "test.user@example.com", password: "testPassword123!")

    puts "Setting up initial data..."
    SetupService.setup(user)

    puts "Setting up current budget..."
    budget_service = BudgetService.new
    budget = budget_service.find_or_create_budget(Date.today.month, Date.today.year)
    budget_service.calculate_budget(budget)
  end

  task transactions: :environment do
    puts "Creating Random Transactions..."
    1000.times do
      TransactionService.create_transaction({
        account_id: Account.all.sample.id,
        category_id: Category.all.sample.id,
        amount: Faker::Number.decimal(l_digits: 2),
        description: Faker::Lorem.sentence(word_count: 3),
        entry: Faker::Date.between(from: 1.year.ago, to: Date.today)
      })
    end
  end
end
