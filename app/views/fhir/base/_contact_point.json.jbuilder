json.system contact_point.system unless contact_point.system.nil?
json.value  contact_point.value unless contact_point.value.nil?
json.use    contact_point.use unless contact_point.use.nil?

json.period do
  json.partial! 'fhir/base/period', period: contact_point.period
end unless contact_point.period.nil?