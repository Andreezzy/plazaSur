json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/atp_imposts/atp_impost", atp_impost: @atp_impost
end
