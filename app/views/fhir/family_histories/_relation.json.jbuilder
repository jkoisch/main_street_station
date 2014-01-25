json.name relation.name unless relation.name.nil?

json.relationship do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: relation.relationship
end unless relation.relationship.nil?

json.bornPeriod do
  json.partial! 'fhir/base/period', period: relation.born_period
end unless relation.born_period.nil?

json.deceasedBoolean  relation.deceased_boolean unless relation.deceased_boolean.nil?
json.note             relation.note unless relation.note.nil?

json.condition relation.condition do |condition|
  json.partial! 'condition', condition: condition
end unless relation.condition.nil?