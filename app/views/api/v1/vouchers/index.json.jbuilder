json.status @status
json.msg @msg
json.result do
	json.vouchers do
		json.array! @vouchers, partial: 'api/v1/vouchers/voucher', as: :voucher
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

