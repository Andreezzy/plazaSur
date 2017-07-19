json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/products/product", product: @product
	json.category_id @category.id
	json.category @category.name	
	json.unity_id @unity.id
	json.unity @unity.unity
end