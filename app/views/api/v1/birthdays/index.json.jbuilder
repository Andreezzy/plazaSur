json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @birthdays, partial: 'api/v1/birthdays/birthday', as: :birthday
	end
	json.partial! 'api/v1/apagination/apagination', totalPages: @totalPage, currentPage: @page, from: @start, to: @end, totalRecords: @totalReg
end

