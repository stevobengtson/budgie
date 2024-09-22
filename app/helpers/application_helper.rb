module ApplicationHelper
  include Pagy::Frontend

  def icon(name, options = {})
    options[:class] = "fa-solid fa-#{name} #{options[:class]}"
    content_tag(:i, nil, options)
  end

  def nav_link(link_text, link_path, link_icon, active = false)
    class_name = active ? "active" : ""
    content_tag(:li, class: class_name) do
      link_to(link_path, class: "flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group") do
        concat(icon(link_icon))
        concat(content_tag(:span, link_text, class: "ms-3"))
      end
    end
  end
end
