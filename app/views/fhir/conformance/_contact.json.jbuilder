json.name   contact.name unless contact.name.nil?

json.telecom contact.telecom do |telecom|
  json.partial! 'fhir/base/contact', contact: telecom
end unless contact.telecom.nil?