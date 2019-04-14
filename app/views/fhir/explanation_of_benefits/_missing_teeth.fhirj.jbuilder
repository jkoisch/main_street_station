json.tooth do
  json.partial! 'fhir/base/coding', coding: missing_teeth.tooth
end unless missing_teeth.tooth.nil?

json.reason do
  json.partial! 'fhir/base/coding', coding: missing_teeth.reason
end unless missing_teeth.reason.nil?

json.extractionDate missing_teeth.extraction_date unless missing_teeth.extraction_date.nil?