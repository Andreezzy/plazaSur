json.status @status
json.msg @msg
json.result do
	json.unities do
		json.array! @unities, partial: 'api/v1/unities/unity', as: :unity
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

