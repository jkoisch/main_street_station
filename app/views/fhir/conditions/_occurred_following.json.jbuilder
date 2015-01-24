json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: due_to.code
end unless due_to.code.nil?

json.target due_to.target do
  json.partial! 'fhir/base/resource_reference', resource_reference: due_to.target
end unless due_to.target.nil?