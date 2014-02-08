json.summary do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: stage.summary
end unless stage.summary.nil?