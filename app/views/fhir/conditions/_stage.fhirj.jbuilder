json.summary do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: stage.summary
end unless stage.summary.nil?

json.assessment stage.assessment do |assessment|
  json.partial! 'fhir/base/reference', reference: assessment
end unless stage.assessment.nil?