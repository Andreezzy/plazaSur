json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/customers/customer", customer: @customer
end
