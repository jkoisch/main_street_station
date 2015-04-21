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

json.address resource.address do |address|
  json.partial! 'fhir/base/address', address: address
end unless resource.address.nil?

json.gender     resource.gender unless resource.gender.nil?
json.birthDate  resource.birth_date unless resource.birth_date.nil?

json.practitionerRole resource.practitioner_role do |role|
  json.partial! 'practitioner_role', practitioner_role: role
end unless resource.practitioner_role.nil?

json.qualification resource.qualification do |qualification|
  json.partial! 'qualification', qualification: qualification
end unless resource.qualification.nil?

json.communication resource.communication do |communication|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: communication
end unless resource.communication.nil?