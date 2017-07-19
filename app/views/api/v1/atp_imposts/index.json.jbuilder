json.status @status
json.msg @msg
json.result do
	json.categories do
		json.array! @atp_imposts, partial: 'api/v1/atp_imposts/atp_impost', as: :atp_impost
	end
	json.partial! 'api/v1/apagination/apagination', totalPages: @totalPage, currentPage: @page, from: @start, to: @end, totalRecords: @totalReg
end


