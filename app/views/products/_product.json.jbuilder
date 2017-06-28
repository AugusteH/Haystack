json.extract! product, :id, :name, :description, :client_id, :category, :price_cents, :quantity, :active, :subcategory, :distribution, :unique_selling_propositions, :distribution_limitations, :distribution_channels, :approvals_certifications, :private_label_capability, :drop_ship_capability, :target_audience
json.url product_url(product, format: :json)
