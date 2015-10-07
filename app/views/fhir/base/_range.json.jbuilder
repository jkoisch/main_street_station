json.low do
  json.partial! 'fhir/base/quantity', quantity: range.low
end unless range.low.nil?

json.high do
  json.partial! 'fhir/base/quantity', quantity: range.high
end unless range.high.nil?