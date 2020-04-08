json.extract! product, :id, :vendor_id, :name, :about, :created_at, :updated_at
json.url product_url(product, format: :json)
