json.system contact.system unless contact.system.nil?
json.value  contact.value unless contact.value.nil?
json.use    contact.use unless contact.use.nil?

json.period do
  json.partial! 'fhir/base/period', period: contact.period
end unless contact.period.nil?
