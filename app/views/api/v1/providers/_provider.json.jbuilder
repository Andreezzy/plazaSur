json.extract! provider, :id, :name, :ruc, :address, :email, :url_page, :url_image, :created_at, :updated_at
json.phones do
	json.array! @phones, :phone
end
json.contacts do
	json.array! @contacts, :name, :last_name, :slast_name, :email, :birthday, :telefono
end