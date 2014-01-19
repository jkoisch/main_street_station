json.identifier resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end if resource.identifier and resource.identifier.length > 0