json.array!(@onomatopoeias) do |onomatopoeia|
  json.extract! onomatopoeia, :id, :name
  json.url onomatopoeia_url(onomatopoeia, format: :json)
end
