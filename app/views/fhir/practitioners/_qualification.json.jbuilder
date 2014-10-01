json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: qualification.code
end unless qualification.code.nil?

json.period do
  json.partial! 'fhir/base/period', period: qualification.period
end unless qualification.period.nil?

json.issuer do
  json.partial! 'fhir/base/resource_reference', resource_reference: qualification.issuer
end unless qualification.issuer.nil?