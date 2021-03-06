json.status @status
json.msg @msg
json.result do
	json.sales do
		json.array! @sales, partial: 'api/v1/sales/sale', as: :sale
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

