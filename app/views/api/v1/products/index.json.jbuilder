json.status @status
json.msg @msg
json.result do
	json.products do
		json.array! @products, partial: 'api/v1/products/eachShow', as: :product
	end
	json.partial! 'api/v1/apagination/apagination', totalPages: @totalPage, currentPage: @page, from: @start, to: @end, totalRecords: @totalReg
end

