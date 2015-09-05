json.name   contact.name unless contact.name.nil?

json.telecom contact.telecom do |telecom|
  json.partial! 'fhir/base/contact_point', contact_point: telecom
end unless contact.telecom.nil?