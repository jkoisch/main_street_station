json.type related_item.type unless related_item.type.nil?

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: related_item.code
end unless related_item.code.nil?