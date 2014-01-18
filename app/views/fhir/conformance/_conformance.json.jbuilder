json.identifier resource.identifier
json.version    resource.version
json.name       resource.name
json.publisher  resource.publisher
json.telecom    resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end if resource.telecom and resource.telecom.length > 0
json.description resource.description if resource.description
json.status      resource.status
json.partial! 'software', software: resource.software
json.partial! 'implementation', implementation: resource.implementation
