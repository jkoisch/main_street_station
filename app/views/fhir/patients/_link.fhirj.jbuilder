json.other do
  json.partial! 'fhir/base/reference', reference: link.other
end unless link.other.nil?

json.type link.type unless link.type.nil?
