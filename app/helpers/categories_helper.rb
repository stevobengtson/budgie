module CategoriesHelper
  def category_group_select_options
    current_user.category_groups.map { |cg| [cg.name, cg.id] }
  end
end
