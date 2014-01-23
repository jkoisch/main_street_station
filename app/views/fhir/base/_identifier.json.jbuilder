json.use    identifier.use unless identifier.use.nil?
json.label  identifier.label unless identifier.label.nil?
json.system identifier.system unless identifier.system.nil?
json.value  identifier.value.to_s unless identifier.value.nil?

json.period do
  json.partial! 'fhir/base/period', period: identifier.period
end unless identifier.period.nil?
