json.system contact.system
json.value  contact.value
json.use    contact.use
if contact.period
  json.period do
    json.partial! 'fhir/base/period', period: contact.period
  end
end
