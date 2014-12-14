json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :start_on, :end_on, :event_id
  json.url schedule_url(schedule, format: :json)
end
