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
  end

  task seed: :environment do
    Rake::Task["budgie:clear"].invoke

    puts "Setting up initial data..."
    SetupService.setup

    puts "Creating Random Transactions..."
    1000.times do
      Transaction.create!(
        account: Account.all.sample,
        category: Category.all.sample,
        amount: Faker::Number.decimal(l_digits: 2),
        description: Faker::Lorem.sentence(word_count: 3),
        entry: Faker::Date.between(from: 1.year.ago, to: Date.today),
      )
    end

    budget_service = BudgetService.new
    budget = budget_service.find_or_create_budget(Date.today.month, Date.today.year)
    budget_service.calculate_budget(budget)
  end
end
