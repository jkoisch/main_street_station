json.coverage do
  json.partial! 'fhir/base/reference', reference: coverage.coverage
end unless coverage.coverage.nil?

json.relationship do
  json.partial! 'fhir/base/coding', coding: coverage.relationship
end unless coverage.relationship.nil?

json.preAuthRef coverage.pre_auth_ref do |ref|
  ref
end unless coverage.pre_auth_ref.nil?