json.extract! attendee, :id, :user_id, :name, :about, :public, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
