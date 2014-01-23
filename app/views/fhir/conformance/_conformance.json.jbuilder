json.resourceType 'Conformance'
json.identifier   resource.identifier unless resource.identifier.nil?
json.version      resource.version unless resource.version.nil?
json.name         resource.name unless resource.name.nil?
json.publisher    resource.publisher unless resource.publisher.nil?

json.telecom resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end unless resource.telecom.nil?

json.description  resource.description unless resource.description.nil?
json.status       resource.status unless resource.status.nil?
json.partial! 'software', software: resource.software unless resource.software.nil?
json.partial! 'implementation', implementation: resource.implementation unless resource.implementation.nil?

json.rest resource.rest do |rest|
  json.partial! 'rest', rest: rest
end unless resource.rest.nil?
