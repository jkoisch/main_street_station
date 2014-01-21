json.relationship contact.relationship do |relationship|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: relationship
end if contact.relationship and contact.relationship.length > 0
if contact.name
  json.name do
    json.partial! 'fhir/base/human_name', human_name: contact.name
  end
end
json.telecom contact.telecom do |telecom|
  json.partial! 'fhir/base/contact', contact: telecom
end if contact.telecom and contact.telecom.length > 0
if contact.address
  json.address do
    json.partial! 'fhir/base/address', address: contact.address
  end
end
if contact.gender
  json.gender do
    json.partial! 'fhir/base/codeable_concept', codeable_concept: contact.gender
  end
end
