json.identifier resource.identifier
json.version    resource.version
json.name       resource.name
json.publisher  resource.publisher
json.telecom    resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end
