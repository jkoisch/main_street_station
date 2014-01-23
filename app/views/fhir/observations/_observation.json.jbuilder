json.resourceType 'Observation'
if resource.name
  json.name do
    json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.name
  end
end
json.valueQuantity  resource.value_quantity if resource.value_quantity
if resource.interpretation
  json.interpretation do
    json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.interpretation
  end
end
json.appliesDatetime  resource.applies_datetime if resource.applies_datetime
json.status resource.status if resource.status
json.reliability  resource.reliability if resource.reliability
if resource.identifier
  json.identifier do
    json.partial! 'fhir/base/identifier', identifier: resource.identifier
  end
end