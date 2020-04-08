json.extract! user, :id, :email, :key, :key_made_at, :token, :token_made_at, :created_at, :updated_at
json.url user_url(user, format: :json)
