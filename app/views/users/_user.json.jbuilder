json.extract! user, :id, :controller, :created_at, :updated_at
json.url user_url(user, format: :json)
