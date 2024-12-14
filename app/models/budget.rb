class Budget < ApplicationRecord
  def month_name
    Date::ABBR_MONTHNAMES[self.month]
  end
end
