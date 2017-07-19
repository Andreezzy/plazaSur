json.status 200
json.msg "ok"
json.result do
	json.partial! "api/v1/plannings/planning", planning: @planning
end
