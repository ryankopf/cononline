json.extract! orderproduct, :id, :quantity, :price, :order_id, :status, :created_at, :updated_at
json.url orderproduct_url(orderproduct, format: :json)
