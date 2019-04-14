json.resourceType  'FamilyMemberHistory'

json.id resource.id unless resource.id.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.patient do
  json.partial! 'fhir/base/reference', reference: resource.patient
end unless resource.patient.nil?

json.date resource.date unless resource.date.nil?
json.status resource.status unless resource.status.nil?
json.name resource.name unless resource.name.nil?

json.relationship do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.relationship
end unless resource.relationship.nil?

json.gender resource.gender unless resource.gender.nil?

json.bornPeriod do
  json.partial! 'fhir/base/period', period: resource.born_period
end unless resource.born_period.nil?

json.bornDate         resource.born_date unless resource.born_date.nil?
json.bornString       resource.born_string unless resource.born_string.nil?

json.ageQuantity do
  json.partial! 'fhir/base/quantity', quantity: resource.age_quantity
end unless resource.age_quantity.nil?

json.ageRange do
  json.partial! 'fhir/base/range', range: resource.age_range
end unless resource.age_range.nil?

json.ageString        resource.age_string unless resource.age_string.nil?

json.deceasedBoolean  resource.deceased_boolean unless resource.deceased_boolean.nil?

json.deceasedQuantity  do
  json.partial! 'fhir/base/quantity', quantity: resource.deceased_quantity
end unless resource.deceased_quantity.nil?

json.deceasedRange do
  json.partial! 'fhir/base/range', range: resource.deceased_range
end unless resource.deceased_range.nil?

json.deceasedDate     resource.deceased_date unless resource.deceased_date.nil?
json.deceasedString   resource.deceased_string unless resource.deceased_string.nil?

json.note do
  json.partial! 'fhir/base/annotation', annotation: resource.note
end unless resource.note.nil?

json.condition resource.condition do |condition|
  json.partial! 'condition', condition: condition
end unless resource.condition.nil?