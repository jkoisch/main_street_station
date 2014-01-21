json.resourceType  'Patient'
json.identifier    resource.identifier do |id|
  json.partial! 'fhir/base/identifier', identifier: id
end if resource.identifier and resource.identifier.length > 0
json.name          resource.name do |name|
  json.partial! 'fhir/base/human_name', human_name: name
end if resource.name and resource.name.length > 0
json.telecom       resource.telecom do |contact|
  json.partial! 'fhir/base/contact', contact: contact
end if resource.telecom and resource.telecom.length > 0
if resource.gender
  json.gender do
    json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.gender
  end
end
json.birthDate     resource.birth_date if resource.birth_date
json.deceasedBoolean resource.deceased_boolean.to_s unless resource.deceased_boolean.nil?
json.address       resource.address do |address|
  json.partial! 'fhir/base/address', address: address
end if resource.address and resource.address.length > 0
json.contact resource.contact do |contact|
  json.partial! 'contact', contact: contact
end if resource.contact
json.active        resource.active if resource.active