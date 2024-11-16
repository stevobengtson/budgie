json.extract! transaction, :id, :entry, :description, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
