json.array!(@categories) do |category|
  json.extract! category, :id, :name, :onomatopoeia_id
  json.url category_url(category, format: :json)
end
