module ApplicationHelper
  include Pagy::Frontend

  def sortable(column, title = nil, css_class = "")
    title ||= column.titleize
    css_class = css_class << (column == sort_column ? " underline font-bold #{sort_direction}" : " underline font-medium")
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    title = title << (sort_direction == "asc" ? " &#8593;" : " &#8595;") if column == sort_column

    link_to raw(title), request.query_parameters.merge({ sort: column, direction: direction }), class: css_class
  end

  def svg_icon(icon, classes = "")
    render "icons/#{icon}", classes: "size-6 #{classes}"
  end

  def new_button(path, label = "New")
    link_to path, class: "btn-primary inline-flex items-center" do
      concat(svg_icon("new", "mr-2"))
      concat(content_tag(:span, label))
    end
  end

  def edit_button(path, label = "Edit")
    link_to path do
      concat(svg_icon("edit", "stroke-black fill-none"))
    end
  end

  def delete_button(path, label = "Delete")
    button_to path, data: { turbo_method: "delete", turbo_confirm: "Are you sure?" }, method: :delete do
      concat(svg_icon("delete", "stroke-red-600 fill-none hover:stroke-red-700"))
    end
  end

  def back_button(path)
    link_to "Back", path, class: "btn-back"
  end

  def cancel_button(path)
    link_to "Cancel", path, class: "btn-cancel", data: { turbo: false }
  end

  def submit_button(form)
    form.submit class: "btn-submit"
  end

  def form_errors(resource)
    return unless resource.errors.any?
    content_tag :div, id: "error_explanation", class: "bg-red-50 text-red-500 px-3 py-2 font-medium rounded-lg mt-3" do
      content_tag :ul do
        resource.errors.full_messages.each do |error|
          concat content_tag(:li, error)
        end
      end
    end
  end

  def nav_class(controller_name)
    controller_name == controller.controller_name ? "border-b-4 " : ""
  end
end
