json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: condition.code
end unless condition.code.nil?

json.outcome do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: condition.outcome
end unless condition.outcome.nil?

json.onsetQuantity do
  json.partial! 'fhir/base/quantity', quantity: condition.onset_quantity
end unless condition.onset_quantity.nil?

json.onsetRange do
  json.partial! 'fhir/base/range', range: condition.onset_range
end unless condition.onset_range.nil?

json.onsetPeriod do
  json.partial! 'fhir/base/period', range: condition.onset_period
end unless condition.onset_period.nil?

json.onsetString  condition.onset_string unless condition.onset_string.nil?

json.note do
  json.partial! 'fhir/base/annotation', annotation: condition.note
end unless condition.note.nil?