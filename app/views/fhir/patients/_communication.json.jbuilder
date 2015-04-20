json.language communication.language do |language|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: language
end unless communication.language.nil?

json.preferred communication.preferred unless communication.preferred.nil?