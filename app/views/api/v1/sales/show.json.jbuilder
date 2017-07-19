json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/sales/sale", sale: @sale
end