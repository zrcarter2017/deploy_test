json.extract! notify, :id, :entity_name, :first_name, :last_name, :created_at, :updated_at
json.url notify_url(notify, format: :json)
