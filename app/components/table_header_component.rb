# frozen_string_literal: true

class TableHeaderComponent < ViewComponent::Base
  def initialize(title:, sortable: false, column: nil)
    @title = title
    @sortable = sortable
    @column = column
  end

  def sortable(column, title = nil)
    direction = params["direction"] == "asc" ? "desc" : "asc"
    link_to(sort: column, direction: direction) do
      if params["sort"] == column
        (@title + " " + sort_indicator).html_safe
      else
        @title
      end
    end
  end

  def sort_indicator
    tag.span(class: "pointer active #{params[:direction]}")
  end
end
