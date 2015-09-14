json.resourceType  'Patient'

json.identifier resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end unless resource.identifier.nil?

json.name resource.name do |name|
  json.partial! 'fhir/base/human_name', human_name: name
end unless resource.name.nil?

json.telecom resource.telecom do |contact|
  json.partial! 'fhir/base/contact_point', contact_point: contact
end unless resource.telecom.nil?

json.gender resource.gender unless resource.gender.nil?

json.birthDate        resource.birth_date unless resource.birth_date.nil?
json.deceasedBoolean  resource.deceased_boolean.to_s unless resource.deceased_boolean.nil?
json.deceasedDatetime resource.deceased_datetime unless resource.deceased_datetime.nil?

json.address resource.address do |address|
  json.partial! 'fhir/base/address', address: address
end unless resource.address.nil?

json.maritalStatus do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.marital_status
end unless resource.marital_status.nil?

json.multipleBirthBoolean resource.multiple_birth_boolean unless resource.multiple_birth_boolean.nil?
json.multipleBirthInteger resource.multiple_birth_integer unless resource.multiple_birth_integer.nil?

json.contact resource.contact do |contact|
  json.partial! 'contact', contact: contact
end unless resource.contact.nil?

json.communication resource.communication do |communication|
  json.partial! 'communication', communication: communication
end unless resource.communication.nil?

json.careProvider resource.care_provider do |care_provider|
  json.partial! 'fhir/base/reference', reference: care_provider
end unless resource.care_provider.nil?

json.managingOrganization do
  json.partial! 'fhir/base/reference', reference: resource.managing_organization
end unless resource.managing_organization.nil?

json.link resource.link do |link|
  json.partial! 'link', link: link
end unless resource.link.nil?

json.active resource.active unless resource.active.nil?