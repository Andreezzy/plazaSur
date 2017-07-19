json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/atp_stocks/atp_stock", atp_stock: @atp_stock
end
