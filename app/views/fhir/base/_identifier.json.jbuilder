json.use    identifier.use unless identifier.use.nil?

json.type do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: identifier.type
end unless identifier.type.nil?

json.system identifier.system unless identifier.system.nil?
json.value  identifier.value.to_s unless identifier.value.nil?

json.period do
  json.partial! 'fhir/base/period', period: identifier.period
end unless identifier.period.nil?

json.assigner do
  json.partial! 'fhir/base/reference', reference: identifier.assigner
end unless identifier.assigner.nil?
