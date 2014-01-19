json.relationship contact.relationship do |relationship|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: relationship
end if contact.relationship && contact.relationship.length > 0
json.name do
  json.partial! 'fhir/base/human_name', human_name: contact.name
end if contact.name