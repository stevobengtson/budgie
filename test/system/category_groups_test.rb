require "application_system_test_case"

class CategoryGroupsTest < ApplicationSystemTestCase
  setup do
    @category_group = category_groups(:one)
  end

  test "visiting the index" do
    visit category_groups_url
    assert_selector "h1", text: "Category groups"
  end

  test "should create category group" do
    visit category_groups_url
    click_on "New category group"

    fill_in "Name", with: @category_group.name
    click_on "Create Category group"

    assert_text "Category group was successfully created"
    click_on "Back"
  end

  test "should update Category group" do
    visit category_group_url(@category_group)
    click_on "Edit this category group", match: :first

    fill_in "Name", with: @category_group.name
    click_on "Update Category group"

    assert_text "Category group was successfully updated"
    click_on "Back"
  end

  test "should destroy Category group" do
    visit category_group_url(@category_group)
    click_on "Destroy this category group", match: :first

    assert_text "Category group was successfully destroyed"
  end
end
