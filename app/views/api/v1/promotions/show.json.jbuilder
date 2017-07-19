json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/promotions/promotion", promotion: @promotion
end