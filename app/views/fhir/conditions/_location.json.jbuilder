json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: location.code
end unless location.code.nil?

json.detail location.detail unless location.detail.nil?