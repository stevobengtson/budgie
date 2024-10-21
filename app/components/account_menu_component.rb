class AccountMenuComponent < ViewComponent::Base
  def initialize(user)
    @user = user
  end

  def render?
    false
    # @user.present? && @user.accounts.any?
  end
end
