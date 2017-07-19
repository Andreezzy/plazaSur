json.status @status
json.msg @msg
json.result do
	json.products do
		json.array! @receipts, partial: 'api/v1/receipts/receipt', as: :receipt
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

