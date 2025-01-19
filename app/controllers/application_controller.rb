class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pagy::Backend
  before_action :load_accounts, if: :authenticated?
  before_action :selected_account, if: :authenticated?
  layout :select_layout

  private

  def load_accounts
    @accounts = Current.user.accounts
  end

  def selected_account
    @all_accounts = true if params[:account_id] == "all"
    @selected_account = Account.find_by(id: params[:account_id]) if params[:account_id] && params[:account_id] != "all"
  end

  def select_layout
    authenticated? ? "application" : "authentication"
  end
end
