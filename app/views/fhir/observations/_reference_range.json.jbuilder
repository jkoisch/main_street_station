json.low  do
  json.partial! 'fhir/base/quantity', quantity: reference_range.low
end unless reference_range.low.nil?

json.high  do
  json.partial! 'fhir/base/quantity', quantity: reference_range.high
end unless reference_range.high.nil?

json.meaning  do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: reference_range.meaning
end unless reference_range.meaning.nil?

json.age do
  json.partial! 'fhir/base/range', range: reference_range.age
end unless reference_range.age.nil?

json.text reference_range.text unless reference_range.text.nil?