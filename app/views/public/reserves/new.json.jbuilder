json.array!(@reserves) do |event|
  json.extract! event, :id, :title, :body
  json.start reserve.start_date
  json.end reserve.end_date
  json.url reserve_url(reserve, format: :html)
end