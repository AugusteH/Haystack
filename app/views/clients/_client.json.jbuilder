json.extract! client, :id,  :name, :firstname, 
        :lastname, :payment, :retailer, 
        :manufacturer, :user_id, :locations, 
        :description, :phone_numbers, :emails, 
        :limitations, :channels, :pricing 
json.url client_url(client, format: :json)