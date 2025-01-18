class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pagy::Backend
  before_action :load_accounts
  before_action :selected_account

  private

  def load_accounts
    @accounts = Account.all
  end

  def selected_account
    @selected_account = Account.find_by(id: params[:account_id])
  end
end
