module ApplicationHelper
  include Pagy::Frontend

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = params["direction"] == "asc" ? "desc" : "asc"
    link_to title, { sort: column, direction: direction }
  end

  def sort_indicator
    tag.span(class: "pointer active #{params[:direction]}")
  end
end
