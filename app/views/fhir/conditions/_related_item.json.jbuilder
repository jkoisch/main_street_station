json.type related_item.type unless related_item.type.nil?

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: related_item.code
end unless related_item.code.nil?

json.target do
  json.partial! 'fhir/base/resource_reference', resource_reference: related_item.target
end unless related_item.target.nil?