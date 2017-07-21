#json.extract! customer, :id, :person_id, :created_at, :updated_at
json.id customer.id
json.first_name customer.name
json.last_name customer.last_name
