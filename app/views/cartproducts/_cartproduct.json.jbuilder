json.extract! cartproduct, :id, :quantity, :cart_id, :product_id, :created_at, :updated_at
json.url cartproduct_url(cartproduct, format: :json)
