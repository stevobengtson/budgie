class Transaction < ApplicationRecord
  belongs_to :account

  def initialize(attributes = {})
    super(attributes)
    self.entry_date ||= Date.today
  end

  def amount=(val)
    self[:amount] = (val.to_f * 100).round
  end

  def amount_to_float
    self.amount / 100.0
  end
end
