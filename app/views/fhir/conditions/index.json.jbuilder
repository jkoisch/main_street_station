json.array!(@conditions) do |condition|
  json.extract! condition, 
  json.url condition_url(condition, format: :json)
end
