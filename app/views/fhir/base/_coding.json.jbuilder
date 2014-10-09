json.system   coding.system unless coding.system.nil?
json.version  coding.version unless coding.version.nil?
json.code     coding.code unless coding.code.nil?
json.display  coding.display unless coding.display.nil?
json.primary  coding.primary unless coding.primary.nil?

json.valueSet do
  json.partial! 'fhir/base/resource_reference', resource_reference: coding.value_set
end unless coding.value_set.nil?
