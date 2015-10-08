json.resourceType  'Questionnaire'

json.id resource.id unless resource.id.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.version   resource.version unless resource.version.nil?
json.status    resource.status unless resource.status.nil?
json.date      resource.date unless resource.date.nil?
json.publisher resource.publisher unless resource.publisher.nil?

json.telecom do
  json.partial! 'fhir/base/contact_point', reference: resource.telecom
end unless resource.telecom.nil?

json.subjectType resource.subject_type unless resource.subject_type.nil?

json.group do
  json.partial! 'group', group: resource.group
end unless resource.group.nil?