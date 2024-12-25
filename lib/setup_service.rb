class SetupService
  def self.setup
    new.setup
  end

  def setup
    create_accounts
    create_category_groups
    create_categories
  end

  private

  def create_accounts
    Account.create!(name: "Checking", account_type: :checking)
    Account.create!(name: "Savings", account_type: :savings)
    Account.create!(name: "Credit Card", account_type: :credit_card)
  end

  def create_category_groups
    CategoryGroup.create!(name: "Income") # This is a special one for income categories, it should not be deleted
    CategoryGroup.create!(name: "Debt")
    CategoryGroup.create!(name: "Home")
    CategoryGroup.create!(name: "Auto")
    CategoryGroup.create!(name: "Utilities")
    CategoryGroup.create!(name: "Essentials")
    CategoryGroup.create!(name: "Entertainment")
    CategoryGroup.create!(name: "Subscriptions")
    CategoryGroup.create!(name: "Health")
    CategoryGroup.create!(name: "Miscellaneous")
  end

  def create_categories
    # Income categories, there should be at least one
    Category.create!(name: "Paycheck", category_group: CategoryGroup.find_by(name: "Income"), is_income: true)
    Category.create!(name: "Other", category_group: CategoryGroup.find_by(name: "Income"), is_income: true)

    # Expense categories
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
  end
end
