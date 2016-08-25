json.extract! message, :id, :user, :message, :created_at, :updated_at
json.url message_url(message, format: :json)