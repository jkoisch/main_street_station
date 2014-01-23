json.resourceType  'Patient'

json.identifier resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end unless resource.identifier.nil?

json.name resource.name do |name|
  json.partial! 'fhir/base/human_name', human_name: name
end unless resource.name.nil?

json.telecom resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end unless resource.telecom.nil?

json.gender do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.gender
end unless resource.gender.nil?

json.birthDate        resource.birth_date unless resource.birth_date.nil?
json.deceasedBoolean  resource.deceased_boolean.to_s unless resource.deceased_boolean.nil?

json.address resource.address do |address|
  json.partial! 'fhir/base/address', address: address
end unless resource.address.nil?

json.contact resource.contact do |contact|
  json.partial! 'contact', contact: contact
end unless resource.contact.nil?

json.active resource.active unless resource.active.nil?