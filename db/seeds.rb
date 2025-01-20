# Create a user
steven = User.create!(
  email_address: 'steven.bengtson@me.com',
  password: 'sopjip-muhBot-jehco2',
)

Account.create!(name: 'Primary', account_type: :checking, user: steven)
Account.create!(name: 'Savings', account_type: :savings, user: steven)
Account.create!(name: 'Visa', account_type: :credit_card, credit: true, user: steven)

income = CategoryGroup.create!(name: "Income", is_income: true, user: User.first)
Category.create!(name: "Paycheck", category_group: income, is_income: true)
Category.create!(name: "Other", category_group: income, is_income: true)

debt = CategoryGroup.create!(name: "Debt", user: User.first)
Category.create!(name: "Credit Card Payment", category_group: debt)
Category.create!(name: "Car Loan Payment", category_group: debt)
Category.create!(name: "Credit Line Payment", category_group: debt)
Category.create!(name: "Support", category_group: debt)

home = CategoryGroup.create!(name: "Home", user: User.first)
Category.create!(name: "Rent", category_group: home)
Category.create!(name: "Fortis BC", category_group: home)
Category.create!(name: "BC Hydro", category_group: home)
Category.create!(name: "Water", category_group: home)
Category.create!(name: "Garbage", category_group: home)
Category.create!(name: "Sewer", category_group: home)
Category.create!(name: "Household", category_group: home)
Category.create!(name: "Rental Insurance", category_group: home)

auto = CategoryGroup.create!(name: "Auto", user: User.first)
Category.create!(name: "Gas", category_group: auto)
Category.create!(name: "Insurance", category_group: auto)
Category.create!(name: "Maintenance", category_group: auto)

essentials = CategoryGroup.create!(name: "Essentials", user: User.first)
Category.create!(name: "Groceries", category_group: essentials)
Category.create!(name: "Cell Phone", category_group: essentials)
Category.create!(name: "Bank Fees", category_group: essentials)
Category.create!(name: "Medical", category_group: essentials)
Category.create!(name: "Pets", category_group: essentials)
Category.create!(name: "Transit", category_group: essentials)
Category.create!(name: "School", category_group: essentials)

entertainment = CategoryGroup.create!(name: "Entertainment", user: User.first)
Category.create!(name: "Kelly", category_group: entertainment)
Category.create!(name: "Natasha", category_group: entertainment)
Category.create!(name: "Dining Out", category_group: entertainment)
Category.create!(name: "Fun Money", category_group: entertainment)
Category.create!(name: "Office", category_group: entertainment)
Category.create!(name: "Special", category_group: entertainment)

subscriptions = CategoryGroup.create!(name: "Subscriptions", user: User.first)
Category.create!(name: "Plex Pass", category_group: subscriptions)
Category.create!(name: "Amazon Prime", category_group: subscriptions)
Category.create!(name: "You Tube", category_group: subscriptions)
Category.create!(name: "Spotify", category_group: subscriptions)
Category.create!(name: "Apple Service", category_group: subscriptions)
Category.create!(name: "Twitch", category_group: subscriptions)
Category.create!(name: "Nintendo", category_group: subscriptions)
Category.create!(name: "Discord", category_group: subscriptions)

long_term = CategoryGroup.create!(name: "Long Term", user: User.first)
Category.create!(name: "Christmas", category_group: long_term)
Category.create!(name: "Investment Fees", category_group: long_term)
Category.create!(name: "Retirement", category_group: long_term)
Category.create!(name: "Emergency", category_group: long_term)
