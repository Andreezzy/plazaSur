json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/packages/package", package: @package
end
