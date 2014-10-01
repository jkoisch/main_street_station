json.low do
  json.partial! 'fhir/base/quantity', low: range.low
end unless range.low.nil?

json.high do
  json.partial! 'fhir/base/quantity', high: range.high
end unless range.high.nil?