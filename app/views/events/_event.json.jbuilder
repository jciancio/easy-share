json.extract! event, :id, :name, :description, :creator, :created_at, :updated_at
json.url event_url(event, format: :json)