module AccountsHelper
  def account_type_options
    Account.account_types.keys.map { |k| [k.humanize.capitalize, k] }
  end
end
