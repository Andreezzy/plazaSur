json.status @status
json.msg @msg
json.result do
	json.products do
		json.array! @proof_sales, partial: 'api/v1/proof_sales/proof_sale', as: :proof_sale
	end
	json.pagination do
		json.total @totalPage
		json.currentPage @page
		json.start @start
		json.end @end
		json.totalCount @totalReg
	end
end

