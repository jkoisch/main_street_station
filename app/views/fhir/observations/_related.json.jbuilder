json.type  related.type unless related.type.nil?

json.target  do
  json.partial! 'fhir/base/resource_reference', resource_reference: related.target
end unless related.target.nil?