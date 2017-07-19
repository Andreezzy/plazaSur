json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @contacts, partial: 'api/v1/contacts/contact', as: :contact
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

