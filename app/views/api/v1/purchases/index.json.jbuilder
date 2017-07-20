json.status @status
json.msg @msg
json.result do
	json.purchases do
		json.array! @purchases, partial: 'api/v1/purchases/purchase', as: :purchase
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

