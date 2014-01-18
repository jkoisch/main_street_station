if sampled_data.origin
  json.origin do
    json.partial! 'fhir/base/quantity', origin: sampled_data.origin
  end
end
json.period       sampled_data.period if sampled_data.period
json.factor       sampled_data.factor if sampled_data.factor
json.lower_limit  sampled_data.lower_limit if sampled_data.lower_limit
json.upper_limit  sampled_data.upper_limit if sampled_data.upper_limit
json.dimensions   sampled_data.dimensions if sampled_data.dimensions
json.data         sampled_data.data if sampled_data.data
