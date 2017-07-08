json.extract! person, :id, :name, :last_name, :slast_name, :phone, :email, :birthday, :created_at, :updated_at
json.url person_url(person, format: :json)
