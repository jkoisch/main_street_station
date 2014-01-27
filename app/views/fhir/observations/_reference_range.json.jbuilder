json.low  reference_range.low unless reference_range.low.nil?
json.high reference_range.high unless reference_range.high.nil?

json.meaning  do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: reference_range.meaning
end unless reference_range.meaning.nil?

json.age do
  json.partial! 'fhir/base/period', period: reference_range.age
end unless reference_range.age.nil?