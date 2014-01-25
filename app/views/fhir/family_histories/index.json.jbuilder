json.array!(@family_histories) do |family_history|
  json.extract! family_history, 
  json.url family_history_url(family_history, format: :json)
end
