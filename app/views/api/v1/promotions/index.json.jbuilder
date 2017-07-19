json.status @status
json.msg @msg
json.result do
	json.products do
		json.array! @promotions, partial: 'api/v1/promotions/promotion', as: :promotion
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

