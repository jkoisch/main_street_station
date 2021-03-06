json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: evidence.code
end unless evidence.code.nil?

json.detail evidence.detail do |detail|
  json.partial! 'fhir/base/reference', reference: detail
end unless evidence.detail.nil?
