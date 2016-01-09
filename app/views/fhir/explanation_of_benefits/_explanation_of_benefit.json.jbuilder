json.resourceType  'ExplanationOfBenefit'

json.id resource.id unless resource.id.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.claim do
  json.partial! 'fhir/base/reference', reference: resource.claim
end unless resource.claim.nil?

json.claimResponse do
  json.partial! 'fhir/base/reference', reference: resource.claim_response
end unless resource.claim_response.nil?

json.created resource.created unless resource.created.nil?
json.disposition resource.disposition unless resource.disposition.nil?

json.organization do
  json.partial! 'fhir/base/reference', reference: resource.organization
end unless resource.organization.nil?

json.patient do
  json.partial! 'fhir/base/reference', reference: resource.patient
end unless resource.patient.nil?

json.coverage do
  json.partial! 'coverage', coverage: resource.coverage
end unless resource.coverage.nil?

json.item resource.item do |item|
  json.partial! 'item', item: item
end unless resource.item.nil?

json.claimTotal do
  json.partial! 'fhir/base/quantity', quantity: resource.claim_total
end unless resource.claim_total.nil?

json.totalBenefit do
  json.partial! 'fhir/base/quantity', quantity: resource.total_benefit
end unless resource.total_benefit.nil?