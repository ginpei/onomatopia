json.array!(@onomatopes) do |onomatope|
  json.extract! onomatope, :id, :name
  json.url onomatope_url(onomatope, format: :json)
end
