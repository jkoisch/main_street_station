json.resourceType 'Organization'

json.identifier do
  json.partial! 'fhir/base/identifier', identifier: resource.identifier
end unless resource.identifier.nil?

json.name resource.name unless resource.name.nil?

json.type do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.type
end unless resource.type.nil?

json.telecom resource.telecom do |telecom|
  json.partial! 'fhir/base/contact', contact: telecom
end unless resource.telecom.nil?

json.address resource.address do |address|
  json.partial! 'fhir/base/address', address: address
end unless resource.address.nil?

json.contact resource.contact do |contact|
  json.partial! 'contact', contact: contact
end unless resource.contact.nil?

json.active resource.active unless resource.active.nil?