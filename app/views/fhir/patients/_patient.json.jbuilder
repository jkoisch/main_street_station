json.identifier resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end if resource.identifier and resource.identifier.length > 0
json.name resource.name do |name|
  json.partial! 'fhir/base/human_name', human_name: name
end if resource.name and resource.name.length > 0
json.telecom resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end if resource.telecom and resource.telecom.length > 0