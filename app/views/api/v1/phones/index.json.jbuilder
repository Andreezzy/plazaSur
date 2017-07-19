json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @phones, partial: 'api/v1/phones/phone', as: :phone
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end


