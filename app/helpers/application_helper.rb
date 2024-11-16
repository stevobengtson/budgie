module ApplicationHelper
  include Pagy::Frontend

  def sortable(column, title = nil, css_class = "")
    title ||= column.titleize
    css_class = css_class << (column == sort_column ? " underline font-bold #{sort_direction}" : " underline font-medium")
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    title = title << (sort_direction == "asc" ? " &#8593;" : " &#8595;") if column == sort_column

    link_to raw(title), request.query_parameters.merge({ sort: column, direction: direction }), class: css_class
  end
end
