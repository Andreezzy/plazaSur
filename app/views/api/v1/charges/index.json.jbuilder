json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @charges, partial: 'api/v1/charges/charge', as: :charge
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

