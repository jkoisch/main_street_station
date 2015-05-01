json.resourceType 'Observation'

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.code
end unless resource.code.nil?

json.valueQuantity do
  json.partial! 'fhir/base/quantity', quantity: resource.value_quantity
end unless resource.value_quantity.nil?

json.valueCodeableConcept do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.value_codeable_concept
end unless resource.value_codeable_concept.nil?

json.valueString      resource.value_string unless resource.value_string.nil?

json.valueRange do
  json.partial! 'fhir/base/range', range: resource.value_range
end unless resource.value_range.nil?

json.valueRatio do
  json.partial! 'fhir/base/ratio', ratio: resource.value_ratio
end unless resource.value_ratio.nil?

json.valueSampledData do
  json.partial! 'fhir/base/sampled_data', sampled_data: resource.value_sampled_data
end unless resource.value_sampled_data.nil?

json.valueAttachment do
  json.partial! 'fhir/base/attachment', attachment: resource.value_attachment
end unless resource.value_attachment.nil?

json.valueDateTime resource.value_date_time unless resource.value_date_time.nil?

json.valueTime        resource.value_time unless resource.value_time.nil?
json.valueString      resource.value_string unless resource.value_string.nil?

json.valuePeriod do
  json.partial! 'fhir/base/period', period: resource.value_period
end unless resource.value_period.nil?

json.dataAbsentReason do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.data_absent_reason
end unless resource.data_absent_reason.nil?

json.interpretation do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.interpretation
end unless resource.interpretation.nil?

json.comments         resource.comments unless resource.comments.nil?
json.appliesDatetime  resource.applies_date unless resource.applies_date.nil?

json.appliesPeriod do
  json.partial! 'fhir/base/period', period: resource.applies_period
end unless resource.applies_period.nil?

json.issued           resource.issued unless resource.issued.nil?
json.status           resource.status unless resource.status.nil?
json.reliability      resource.reliability unless resource.reliability.nil?

json.bodySiteCodeableConcept do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.body_site_codeable_concept
end unless resource.body_site_codeable_concept.nil?

json.bodySiteResourceReference do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.body_site_resource_reference
end unless resource.body_site_resource_reference.nil?

json.set! :method do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.method
end unless resource.method.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.subject do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.subject
end unless resource.subject.nil?

json.specimen do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.specimen
end unless resource.specimen.nil?

json.performer resource.performer do |performer|
  json.partial! 'fhir/base/resource_reference', resource_reference: performer
end unless resource.performer.nil?

json.device do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.device
end unless resource.device.nil?

json.encounter do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.encounter
end unless resource.encounter.nil?

json.referenceRange resource.reference_range do |reference_range|
  json.partial! 'reference_range', reference_range: reference_range
end unless resource.reference_range.nil?

json.related resource.related do |related|
  json.partial! 'related', related: related
end unless resource.related.nil?