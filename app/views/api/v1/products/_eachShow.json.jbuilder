json.extract! product, :id, :name, :description, :bar_code, :flag, :url_image, :suggested_price
json.category_id product.category.id
json.category product.category.name	
json.unity_id product.unity.id
json.unity product.unity.unity