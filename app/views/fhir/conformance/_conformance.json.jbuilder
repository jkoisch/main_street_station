json.resourceType 'Conformance'
json.identifier   resource.identifier if resource.identifier
json.version      resource.version if resource.version
json.name         resource.name if resource.name
json.publisher    resource.publisher if resource.publisher
json.telecom      resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end if resource.telecom and resource.telecom.length > 0
json.description  resource.description if resource.description
json.status       resource.status if resource.status
json.partial! 'software', software: resource.software if resource.software
json.partial! 'implementation', implementation: resource.implementation if resource.implementation
json.rest         resource.rest do |rest|
  json.partial! 'rest', rest: rest
end
