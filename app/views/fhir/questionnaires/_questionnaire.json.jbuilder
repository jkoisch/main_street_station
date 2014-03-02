json.resourceType  'Questionnaire'

json.status   resource.status unless resource.status.nil?
json.authored resource.authored unless resource.authored.nil?

json.name do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.name
end unless resource.name.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.group do
  json.partial! 'group', group: resource.group
end unless resource.group.nil?