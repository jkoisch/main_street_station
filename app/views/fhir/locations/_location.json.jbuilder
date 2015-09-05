json.resourceType  'Location'

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.name   resource.name unless resource.name.nil?
json.description resource.description unless resource.description.nil?
json.mode resource.mode unless resource.mode.nil?

json.type do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.type
end unless resource.type.nil?

json.telecom resource.telecom do |telecom|
  json.partial! 'fhir/base/contact_point', contact_point: telecom
end unless resource.telecom.nil?

json.address do
  json.partial! 'fhir/base/address', address: resource.address
end unless resource.address.nil?

json.physicalType do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.physical_type
end unless resource.physical_type.nil?

json.position do
  json.partial! 'position', position: resource.position
end unless resource.position.nil?

json.managingOrganization do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.managing_organization
end unless resource.managing_organization.nil?

json.partOf do
  json.partial! 'fhir/base/resource_reference', resource_reference: resource.part_of
end unless resource.part_of.nil?

json.status resource.status unless resource.status.nil?
