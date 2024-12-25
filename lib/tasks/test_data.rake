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
    categories = []
    categories << Category.create!(name: "Paycheck", category_group: CategoryGroup.find_by(name: "Income"))
    categories << Category.create!(name: "Bonus", category_group: CategoryGroup.find_by(name: "Income"))
    categories << Category.create!(name: "Interest", category_group: CategoryGroup.find_by(name: "Income"))
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

    puts "Creating current budget..."
    current_date = Date.today
    BudgetService.new.find_or_create_budget(current_date.month, current_date.year)

    # puts "Creating Transactions..."
    # 1000.times do
    #   Transaction.create!(
    #     account: Account.all.sample,
    #     category: Category.all.sample,
    #     amount: Faker::Number.decimal(l_digits: 2),
    #     description: Faker::Lorem.sentence(word_count: 3),
    #     entry: Faker::Date.between(from: prev_date.beginning_of_month, to: current_date),
    #   )
    # end
  end
end
