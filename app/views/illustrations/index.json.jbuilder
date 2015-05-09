json.array!(@illustrations) do |illustration|
  json.extract! illustration, :id, :image
  json.url illustration_url(illustration, format: :json)
end
