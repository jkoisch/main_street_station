# TODO: Resource(Organization)  json.assigner  identifier.assigner
json.label  identifier.label

if identifier.period
  json.period do
    json.partial! 'fhir/base/period', period: identifier.period
  end
end

json.system identifier.system
json.use    identifier.use
json.value  identifier.value
