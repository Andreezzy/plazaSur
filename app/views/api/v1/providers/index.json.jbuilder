json.status @status
json.msg @msg
json.result do
	json.providers do
		json.array! @providers, partial: 'api/v1/providers/eachShow', as: :provider
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end
