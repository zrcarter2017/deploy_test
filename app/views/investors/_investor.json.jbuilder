json.extract! investor, :id, :investor_id, :address, :city, :state, :zip, :email, :entity_name, :first_name, :last_name, :rep, :broker, :created_at, :updated_at
json.url investor_url(investor, format: :json)
