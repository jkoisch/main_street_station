json.use    identifier.use if identifier.use
json.label  identifier.label if identifier.label
json.system identifier.system if identifier.system
json.value  identifier.value if identifier.value
if identifier.period
  json.period do
    json.partial! 'fhir/base/period', period: identifier.period
  end
end
# TODO: Resource(Organization)  json.assigner  identifier.assigner
