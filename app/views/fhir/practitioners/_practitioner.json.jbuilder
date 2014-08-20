json.resourceType  'Practitioner'

json.identifier resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end unless resource.identifier.nil?

json.name do
  json.partial! 'fhir/base/human_name', human_name: resource.name
end unless resource.name.nil?

json.telecom resource.telecom do |telecom|
  json.partial! 'fhir/base/contact', contact: telecom
end unless resource.telecom.nil?

json.address do
  json.partial! 'fhir/base/address', address: resource.address
end unless resource.address.nil?

json.gender do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.gender
end unless resource.gender.nil?

json.birthDate        resource.birth_date unless resource.birth_date.nil?

json.organization do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.organization
end unless resource.organization.nil?

json.role resource.role do |role|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: role
end unless resource.role.nil?

json.specialty resource.specialty do |specialty|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: specialty
end unless resource.specialty.nil?

json.period do
  json.partial! 'fhir/base/period', period: resource.period
end unless resource.period.nil?

json.location resource.location do |location|
  json.partial! 'fhir/base/resource_reference', resource_reference: location
end unless resource.location.nil?

json.qualification resource.qualification do |qualification|
  json.partial! 'qualification', qualification: qualification
end unless resource.qualification.nil?

json.communication resource.communication do |communication|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: communication
end unless resource.communication.nil?