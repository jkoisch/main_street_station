json.identifier qualification.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: qualification.identifier
end unless qualification.identifier.nil?

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: qualification.code
end unless qualification.code.nil?

json.period do
  json.partial! 'fhir/base/period', period: qualification.period
end unless qualification.period.nil?

json.issuer do
  json.partial! 'fhir/base/reference', reference: qualification.issuer
end unless qualification.issuer.nil?
