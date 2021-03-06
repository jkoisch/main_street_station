json.organization do
  json.partial! 'fhir/base/reference', reference: practitioner_role.organization
end unless practitioner_role.organization.nil?

json.role do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: practitioner_role.role
end unless practitioner_role.role.nil?

json.specialty practitioner_role.specialty do |specialty|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: specialty
end unless practitioner_role.specialty.nil?

json.period do
  json.partial! 'fhir/base/period', period: practitioner_role.period
end unless practitioner_role.period.nil?

json.location practitioner_role.location do |location|
  json.partial! 'fhir/base/reference', reference: location
end unless practitioner_role.location.nil?

json.healthcareService practitioner_role.healthcare_service do |healthcare_service|
  json.partial! 'fhir/base/reference', reference: healthcare_service
end unless practitioner_role.healthcare_service.nil?