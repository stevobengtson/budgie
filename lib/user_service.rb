class UserService
  def self.create_user(params)
    self.new.create_user(params)
  end

  def create_user(params)
    ActiveRecord::Base.transaction do
      user = User.create!(params)
      SetupService.create_default_accounts(user)
      SetupService.create_default_categories(user)
      user
    end
  end
end
