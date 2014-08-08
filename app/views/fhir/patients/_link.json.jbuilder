json.other do
  json.partial! 'fhir/base/resource_reference', resource_reference: link.other
end unless link.other.nil?

json.type link.type unless link.type.nil?
