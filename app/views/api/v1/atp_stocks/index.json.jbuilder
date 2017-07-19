json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @atp_stocks, partial: 'api/v1/atp_stocks/atp_stock', as: :atp_stock
	end
	json.partial! 'api/v1/apagination/apagination', totalPages: @totalPage, currentPage: @page, from: @start, to: @end, totalRecords: @totalReg
end


