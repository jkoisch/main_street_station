json.id   component.id unless component.id.nil?

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: component.code
end unless component.code.nil?

json.valueQuantity do
  json.partial! 'fhir/base/quantity', quantity: component.value_quantity
end unless component.value_quantity.nil?

json.valueCodeableConcept do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: component.value_codeable_concept
end unless component.value_codeable_concept.nil?

json.valueString      component.value_string unless component.value_string.nil?

json.valueRange do
  json.partial! 'fhir/base/range', range: component.value_range
end unless component.value_range.nil?

json.valueRatio do
  json.partial! 'fhir/base/ratio', ratio: component.value_ratio
end unless component.value_ratio.nil?

json.valueSampledData do
  json.partial! 'fhir/base/sampled_data', sampled_data: component.value_sampled_data
end unless component.value_sampled_data.nil?

json.valueAttachment do
  json.partial! 'fhir/base/attachment', attachment: component.value_attachment
end unless component.value_attachment.nil?

json.valueDateTime component.value_datetime unless component.value_datetime.nil?

json.valueTime        component.value_time unless component.value_time.nil?
json.valueString      component.value_string unless component.value_string.nil?

json.valuePeriod do
  json.partial! 'fhir/base/period', period: component.value_period
end unless component.value_period.nil?

json.dataAbsentReason do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: component.data_absent_reason
end unless component.data_absent_reason.nil?

json.referenceRange component.reference_range do |reference_range|
  json.partial! 'reference_range', reference_range: reference_range
end unless component.reference_range.nil?
