# frozen_string_literal: true

class TableHeadComponent < ViewComponent::Base
  def initialize(columns:)
    @columns = columns
  end
end
