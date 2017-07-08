json.extract! contact, :id, :provider_id, :person_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
