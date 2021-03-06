json.purpose  do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: contact.purpose
end unless contact.purpose.nil?

json.name  do
  json.partial! 'fhir/base/human_name', human_name: contact.name
end unless contact.name.nil?

json.telecom contact.telecom do |telecom|
  json.partial! 'fhir/base/contact_point', contact_point: telecom
end unless contact.telecom.nil?

json.address do
  json.partial! 'fhir/base/address', address: contact.address
end unless contact.address.nil?