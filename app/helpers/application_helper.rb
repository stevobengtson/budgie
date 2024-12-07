module ApplicationHelper
  include Pagy::Frontend

  def sortable(column, title = nil, css_class = "")
    title ||= column.titleize
    css_class = css_class << (column == sort_column ? " underline font-bold #{sort_direction}" : " underline font-medium")
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    title = title << (sort_direction == "asc" ? " &#8593;" : " &#8595;") if column == sort_column

    link_to raw(title), request.query_parameters.merge({ sort: column, direction: direction }), class: css_class
  end

  def new_button(path, label = "New")
    link_to label, path, class: "rounded py-1 px-5 text-white text-center dark:text-black bg-blue-500 hover:bg-blue-600 no-underline inline-block font-medium"
  end

  def edit_button(path)
    link_to "Edit", path, class: "rounded py-1 px-5 text-white text-center dark:text-black bg-teal-500 hover:bg-teal-600 no-underline inline-block font-medium"
  end

  def delete_button(path, label = "Delete")
    button_to label, path, data: { turbo_method: "delete", turbo_confirm: "Are you sure?" }, class: "rounded py-1 px-5 text-center text-white dark:text-black bg-red-300 hover:bg-red-400 inline-block font-medium"
  end

  def back_button(path)
    link_to "Back", path, class: "rounded py-1 px-5 text-black text-center bg-gray-100 hover:bg-gray-200 no-underline inline-block font-medium"
  end

  def cancel_button(path)
    link_to "Cancel", path, class: "rounded py-1 px-5 text-black text-center bg-gray-100 hover:bg-gray-200 no-underline inline-block font-medium", data: { turbo: false }
  end

  def submit_button(form)
    form.submit class: "rounded py-1 px-5 text-white text-center dark:text-black bg-teal-500 hover:bg-teal-600 no-underline inline-block font-medium"
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
end
