class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    User.transaction do
      @user = User.create!(user_params)
      if @user.persisted?
        SetupService.create_default_accounts(@user)
        SetupService.create_default_categories(@user)
        start_new_session_for @user
        redirect_to root_path, notice: "Successfully signed up!"
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
