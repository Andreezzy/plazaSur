json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/proof_sales/proof_sale", proof_sale: @proof_sale
end