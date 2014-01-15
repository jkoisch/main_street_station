json.data         sampled_data.data
json.dimensions   sampled_data.dimensions
json.factor       sampled_data.factor
json.lower_limit  sampled_data.lower_limit

if sampled_data.origin
  json.origin do
    json.partial! 'fhir/base/quantity', origin: sampled_data.origin
  end
end

json.period       sampled_data.period
json.upper_limit  sampled_data.upper_limit
