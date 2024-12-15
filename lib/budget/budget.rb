module Budget
  class Budget
    def new_budget(month, year)
      budget = Budget.new(month: month, year: year)
      budget.save!
      budget
    end
  end
end
