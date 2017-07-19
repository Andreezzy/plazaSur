json.status @status
json.msg @msg
json.result do
	json.products do
		json.array! @warehouses, partial: 'api/v1/warehouses/warehouse', as: :warehouse
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

