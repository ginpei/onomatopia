json.array!(@categories) do |category|
  json.extract! category, :id, :name, :onomatope_id
  json.url category_url(category, format: :json)
end
