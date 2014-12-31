json.resourceType 'Conformance'
json.identifier   resource.identifier unless resource.identifier.nil?
json.version      resource.version unless resource.version.nil?
json.name         resource.name unless resource.name.nil?
json.publisher    resource.publisher unless resource.publisher.nil?

json.telecom resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end unless resource.telecom.nil?

json.description    resource.description unless resource.description.nil?
json.status         resource.status unless resource.status.nil?
json.experimental   resource.experimental unless resource.experimental.nil?
json.date           resource.date unless resource.date.nil?

json.software do
  json.partial! 'software', software: resource.software
end unless resource.software.nil?

json.implementation do
  json.partial! 'implementation', implementation: resource.implementation
end unless resource.implementation.nil?

json.fhirVersion    resource.fhir_version unless resource.fhir_version.nil?
json.acceptUnknown  resource.accept_unknown unless resource.accept_unknown.nil?
json.format         resource.format unless resource.format.nil?

json.profile resource.profile do |profile|
  json.partial 'fhir/base/resource_reference', resource_reference: profile
end unless resource.profile.nil?

json.rest resource.rest do |rest|
  json.partial! 'rest', rest: rest
end unless resource.rest.nil?

json.messaging resource.messaging do |messaging|
  json.partial! 'messaging', messaging: messaging
end unless resource.messaging.nil?

json.document resource.document do |document|
  json.partial! 'document', document: document
end unless resource.document.nil?
