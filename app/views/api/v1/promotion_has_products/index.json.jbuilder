json.status @status
json.msg @msg
json.result do
	json.products do
		json.array! @promotion_has_products, partial: 'api/v1/promotion_has_products/promotion_has_product', as: :promotion_has_product
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

