json.resourceType 'Observation'

json.name do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.name
end unless resource.name.nil?

json.valueQuantity do
  json.partial! 'fhir/base/quantity', quantity: resource.value_quantity
end unless resource.value_quantity.nil?

json.valueCodeableConcept do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.value_codeable_concept
end unless resource.value_codeable_concept.nil?

json.valueAttachment do
  json.partial! 'fhir/base/attachment', attachment: resource.value_attachment
end unless resource.value_attachment.nil?

json.valueRatio do
  json.partial! 'fhir/base/ratio', ratio: resource.value_ratio
end unless resource.value_ratio.nil?

json.valuePeriod do
  json.partial! 'fhir/base/period', period: resource.value_period
end unless resource.value_period.nil?

json.valueSampledData do
  json.partial! 'fhir/base/sampled_data', sampled_data: resource.value_sampled_data
end unless resource.value_sampled_data.nil?

json.valueString  resource.value_string unless resource.value_string.nil?

json.interpretation do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.interpretation
end unless resource.interpretation.nil?

json.comments         resource.comments unless resource.comments.nil?
json.appliesDatetime  resource.applies_datetime unless resource.applies_datetime.nil?

json.appliesPeriod do
  json.partial! 'fhir/base/period', period: resource.applies_period
end unless resource.applies_period.nil?

json.issued           resource.issued unless resource.issued.nil?
json.status           resource.status unless resource.status.nil?
json.reliability      resource.reliability unless resource.reliability.nil?

json.bodySite do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.body_site
end unless resource.body_site.nil?

json.set! :method do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.method
end unless resource.method.nil?

json.identifier do
  json.partial! 'fhir/base/identifier', identifier: resource.identifier
end unless resource.identifier.nil?

json.referenceRange resource.reference_range do |reference_range|
  json.partial! 'reference_range', reference_range: reference_range
end unless resource.reference_range.nil?
