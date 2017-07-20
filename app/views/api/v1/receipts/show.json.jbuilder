json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/receipts/receipt", receipt: @receipt
	#json.user_id @user.id
	#json.user @user.name

	json.products do
		json.array!(@products) do |p|
		  json.id p.product.id
		  json.name p.product.name
		  json.quantity p.quantity
		  json.due_date p.due_date
		  json.total_price p.total_price_product
		end
	end
end