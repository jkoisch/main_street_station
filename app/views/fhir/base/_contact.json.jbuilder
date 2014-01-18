json.system contact.system if contact.system
json.value  contact.value if contact.value
json.use    contact.use if contact.use
if contact.period
  json.period do
    json.partial! 'fhir/base/period', period: contact.period
  end
end
