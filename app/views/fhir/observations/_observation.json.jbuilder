json.resourceType 'Observation'

json.name do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.name
end unless resource.name.nil?

json.valueQuantity    resource.value_quantity unless resource.value_quantity.nil?

json.interpretation do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.interpretation
end unless resource.interpretation.nil?

json.appliesDatetime  resource.applies_datetime unless resource.applies_datetime.nil?
json.status           resource.status unless resource.status.nil?
json.reliability      resource.reliability unless resource.reliability.nil?

json.identifier do
  json.partial! 'fhir/base/identifier', identifier: resource.identifier
end unless resource.identifier.nil?