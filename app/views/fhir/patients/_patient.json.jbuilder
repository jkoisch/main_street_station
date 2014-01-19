json.identifier resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end if resource.identifier and resource.identifier.length > 0
json.name resource.name do |name|
  json.partail! 'fhir/base/human_name', name: name
end if resource.identifier and resource.identifier.length > 0