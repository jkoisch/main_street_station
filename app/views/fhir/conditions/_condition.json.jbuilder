json.resourceType 'Condition'

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.dateAsserted resource.date_asserted unless resource.date_asserted.nil?

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.code
end unless resource.code.nil?

json.category do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.category
end unless resource.category.nil?

json.status resource.status unless resource.status.nil?

json.certainty do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.certainty
end unless resource.certainty.nil?

json.severity do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.severity
end unless resource.severity.nil?

json.onsetDate resource.onset_date unless resource.onset_date.nil?
json.onsetAge resource.onset_age unless resource.onset_age.nil?
json.abatementDate resource.abatement_date unless resource.abatement_date.nil?
json.abatementAge   resource.abatement_age unless resource.abatement_age.nil?
json.abatementBoolean resource.abatement_boolean unless resource.abatement_boolean.nil?
json.stage  resource.stage unless resource.stage.nil?

json.evidence resource.evidence do |evidence|
  json.partial! 'evidence', evidence: evidence
end unless resource.evidence.nil?

json.location resource.location do |location|
  json.partial! 'location', location: location
end unless resource.location.nil?

json.relatedItem resource.related_item do |item|
  json.partial! 'related_item', related_item: item
end unless resource.related_item.nil?

json.notes resource.notes unless resource.notes.nil?
