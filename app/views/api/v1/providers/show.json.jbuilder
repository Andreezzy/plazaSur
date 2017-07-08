json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/providers/provider", provider: @provider, phones: @phones, contacts: @contacts
end