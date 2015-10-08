json.resourceType  'Device'

json.id resource.id unless resource.id.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.type do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.type
end unless resource.type.nil?

json.note resource.note do |note|
  json.partial! 'fhir/base/annotation', annotation: note
end unless resource.note.nil?

json.status         resource.status unless resource.status.nil?
json.manufacturer   resource.manufacturer unless resource.manufacturer.nil?
json.model          resource.model unless resource.model.nil?
json.version        resource.version unless resource.version.nil?
json.manufactureDate  resource.manufacture_date unless resource.manufacture_date.nil?
json.expiry         resource.expiry unless resource.expiry.nil?
json.udi            resource.udi unless resource.udi.nil?
json.lotNumber      resource.lot_number unless resource.lot_number.nil?

json.owner do
  json.partial! 'fhir/base/reference', reference: resource.owner
end unless resource.owner.nil?

json.location do
  json.partial! 'fhir/base/reference', reference: resource.location
end unless resource.location.nil?

json.patient do
  json.partial! 'fhir/base/reference', reference: resource.patient
end unless resource.patient.nil?

json.contact resource.contact do |contact|
  json.partial! 'fhir/base/contact_point', contact_point: contact
end unless resource.contact.nil?

json.url            resource.url unless resource.url.nil?