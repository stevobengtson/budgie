class SetupService
  class << self
    def create_default_accounts(user)
      Account.create!(name: "Checking", account_type: :checking, user: user)
      Account.create!(name: "Savings", account_type: :savings, user: user)
      Account.create!(name: "Credit Card", account_type: :credit_card, credit: true, user: user)
    end

    def create_default_categories(user)
      income = CategoryGroup.create!(name: "Income", is_income: true, user: User.first)
      Category.create!(name: "Paycheck", category_group: income, is_income: true)
      Category.create!(name: "Other", category_group: income, is_income: true)

      debt = CategoryGroup.create!(name: "Debt", user: User.first)
      Category.create!(name: "Credit Card Payment", category_group: debt)
      Category.create!(name: "Car Loan Payment", category_group: debt)

      home = CategoryGroup.create!(name: "Home", user: User.first)
      Category.create!(name: "Rent", category_group: home)
      Category.create!(name: "Internet", category_group: home)
      Category.create!(name: "Electricity", category_group: home)
      Category.create!(name: "Water", category_group: home)
      Category.create!(name: "Gas", category_group: home)
      Category.create!(name: "Garbage", category_group: home)
      Category.create!(name: "Insurance", category_group: home)

      auto = CategoryGroup.create!(name: "Auto", user: User.first)
      Category.create!(name: "Gas", category_group: auto)
      Category.create!(name: "Insurance", category_group: auto)
      Category.create!(name: "Maintenance", category_group: auto)

      essentials = CategoryGroup.create!(name: "Essentials", user: User.first)
      Category.create!(name: "Groceries", category_group: essentials)
      Category.create!(name: "Cell Phone", category_group: essentials)
      Category.create!(name: "Internet", category_group: essentials)

      entertainment = CategoryGroup.create!(name: "Entertainment", user: User.first)
      Category.create!(name: "Cable", category_group: entertainment)
      Category.create!(name: "Dining Out", category_group: entertainment)
      Category.create!(name: "Movies", category_group: entertainment)

      subscriptions = CategoryGroup.create!(name: "Subscriptions", user: User.first)
      Category.create!(name: "Netflix", category_group: subscriptions)
      Category.create!(name: "Hulu", category_group: subscriptions)
      Category.create!(name: "Spotify", category_group: subscriptions)
      Category.create!(name: "Gym", category_group: subscriptions)

      long_term = CategoryGroup.create!(name: "Long Term", user: User.first)
      Category.create!(name: "Emergency Fund", category_group: long_term)
      Category.create!(name: "Retirement", category_group: long_term)
    end
  end
end
