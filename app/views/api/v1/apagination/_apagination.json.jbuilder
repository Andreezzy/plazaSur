json.pagination do
	json.totalPages @totalPage
	json.currentPage @page
	json.from @start
	json.to @end
	json.totalRecords @totalReg
end