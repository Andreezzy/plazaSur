json.status @status
json.msg @msg
json.result do
	json.customers do
		json.array! @customers, partial: 'api/v1/customers/customer', as: :customer
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

