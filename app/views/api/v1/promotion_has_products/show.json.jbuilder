json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/promotion_has_products/promotion_has_product", promotion_has_product: @promotion_has_product
end