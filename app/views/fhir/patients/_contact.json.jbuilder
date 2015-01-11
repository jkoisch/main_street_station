json.relationship contact.relationship do |relationship|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: relationship
end unless contact.relationship.nil?

json.name do
  json.partial! 'fhir/base/human_name', human_name: contact.name
end unless contact.name.nil?

json.telecom contact.telecom do |telecom|
  json.partial! 'fhir/base/contact', contact: telecom
end unless contact.telecom.nil?

json.address do
  json.partial! 'fhir/base/address', address: contact.address
end unless contact.address.nil?

json.gender contact.gender unless contact.gender.nil?

json.organization do
  json.partial! 'fhir/base/resource_reference', resource_reference: contact.organization
end unless contact.organization.nil?

json.period do
  json.partial! 'fhir/base/period', resource_reference: contact.period
end unless contact.period.nil?