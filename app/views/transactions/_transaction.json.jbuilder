json.extract! transaction, :id, :account_id, :memo, :cleared, :amount, :entry_date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
