require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:one)
  end

  test "visiting the index" do
    visit accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "should create account" do
    visit accounts_url
    click_on "New account"

    fill_in "Balance", with: @account.balance
    fill_in "Closed at", with: @account.closed_at
    fill_in "Currency", with: @account.currency
    fill_in "Interest rate", with: @account.interest_rate
    fill_in "Name", with: @account.name
    fill_in "Opened at", with: @account.opened_at
    fill_in "Type", with: @account.type
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "should update Account" do
    visit account_url(@account)
    click_on "Edit this account", match: :first

    fill_in "Balance", with: @account.balance
    fill_in "Closed at", with: @account.closed_at
    fill_in "Currency", with: @account.currency
    fill_in "Interest rate", with: @account.interest_rate
    fill_in "Name", with: @account.name
    fill_in "Opened at", with: @account.opened_at
    fill_in "Type", with: @account.type
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "should destroy Account" do
    visit account_url(@account)
    click_on "Destroy this account", match: :first

    assert_text "Account was successfully destroyed"
  end
end
