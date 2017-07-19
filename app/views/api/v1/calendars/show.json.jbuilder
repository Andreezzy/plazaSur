json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/calendars/calendar", calendar: @calendar
end
