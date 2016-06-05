json.language do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: communication.language
end unless communication.language.nil?

json.preferred communication.preferred unless communication.preferred.nil?