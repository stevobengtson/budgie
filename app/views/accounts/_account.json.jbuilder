json.extract! account, :id, :name, :description, :atype, :currency, :balance, :interest_rate, :opened_at, :closed_at, :created_at, :updated_at
json.url account_url(account, format: :json)
