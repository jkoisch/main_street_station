json.resourceType  'Device'

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.type do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.type
end unless resource.type.nil?

json.manufacturer   resource.manufacturer unless resource.manufacturer.nil?
json.model          resource.model unless resource.model.nil?
json.version        resource.version unless resource.version.nil?
json.expiry         resource.expiry unless resource.expiry.nil?
json.udi            resource.udi unless resource.udi.nil?
json.lotNumber      resource.lot_number unless resource.lot_number.nil?

json.contact resource.contact do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end unless resource.contact.nil?

json.url            resource.url unless resource.url.nil?