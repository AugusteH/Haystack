json.extract! order, :id, :reference, :address_id, :client_id, :total_payment_cents, :status, :created_at, :updated_at
json.url order_url(order, format: :json)