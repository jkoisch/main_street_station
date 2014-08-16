json.resourceType  'Questionnaire'

json.status   resource.status unless resource.status.nil?
json.authored resource.authored unless resource.authored.nil?

json.subject do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.subject
end unless resource.subject.nil?

json.author do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.author
end unless resource.author.nil?

json.source do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.source
end unless resource.source.nil?

json.name do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.name
end unless resource.name.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.encounter do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.encounter
end unless resource.encounter.nil?

json.group do
  json.partial! 'group', group: resource.group
end unless resource.group.nil?