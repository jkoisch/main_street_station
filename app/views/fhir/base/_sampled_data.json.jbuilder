json.origin do
  json.partial! 'fhir/base/quantity', quantity: sampled_data.origin
end unless sampled_data.origin.nil?

json.period       sampled_data.period unless sampled_data.period.nil?
json.factor       sampled_data.factor unless sampled_data.factor.nil?
json.lower_limit  sampled_data.lower_limit unless sampled_data.lower_limit.nil?
json.upper_limit  sampled_data.upper_limit unless sampled_data.upper_limit.nil?
json.dimensions   sampled_data.dimensions unless sampled_data.dimensions.nil?
json.data         sampled_data.data unless sampled_data.data.nil?
