json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, :id, :name, :event_id
  json.url volunteer_url(volunteer, format: :json)
end
