json.type related.type unless related.type.nil?

json.target  do
  json.partial! 'fhir/base/reference', reference: related.target
end unless related.target.nil?