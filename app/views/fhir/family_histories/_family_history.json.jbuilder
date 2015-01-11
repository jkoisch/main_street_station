json.resourceType  'FamilyHistory'

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.patient do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.patient
end unless resource.patient.nil?

json.date resource.date unless resource.date.nil?
json.note resource.note unless resource.note.nil?

json.relation resource.relation do |relation|
  json.partial! 'relation', relation: relation
end unless resource.relation.nil?