json.extract! address, :id, :name, :street, :street_2, :city, :state, :zip, :phone_number, :client_id, :created_at, :updated_at
json.url address_url(address, format: :json)