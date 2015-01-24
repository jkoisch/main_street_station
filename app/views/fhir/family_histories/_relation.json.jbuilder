json.name             relation.name unless relation.name.nil?

json.relationship do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: relation.relationship
end unless relation.relationship.nil?

json.bornPeriod do
  json.partial! 'fhir/base/period', period: relation.born_period
end unless relation.born_period.nil?

json.bornDate         relation.born_date unless relation.born_date.nil?
json.bornString       relation.born_string unless relation.born_string.nil?

json.ageAge do
  json.partial! 'fhir/base/age', age: relation.age_age
end unless relation.age_age.nil?

json.ageRange do
  json.partial! 'fhir/base/range', range: relation.age_range
end unless relation.age_range.nil?

json.ageString        relation.age_string unless relation.age_string.nil?

json.deceasedBoolean  relation.deceased_boolean unless relation.deceased_boolean.nil?

json.deceasedAge  do
  json.partial! 'fhir/base/quantity', quantity: relation.deceased_age
end unless relation.deceased_age.nil?

json.deceasedRange do
  json.partial! 'fhir/base/range', range: relation.deceased_range
end unless relation.deceased_range.nil?

json.deceasedDate     relation.deceased_date unless relation.deceased_date.nil?
json.deceasedString   relation.deceased_string unless relation.deceased_string.nil?
json.note             relation.note unless relation.note.nil?

json.condition relation.condition do |condition|
  json.partial! 'condition', condition: condition
end unless relation.condition.nil?