json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @plannings, partial: 'api/v1/plannings/planning', as: :planning
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end


