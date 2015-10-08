json.resourceType 'Condition'

json.id resource.id unless resource.id.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.patient do
  json.partial! 'fhir/base/reference', reference: resource.patient
end unless resource.patient.nil?

json.encounter do
  json.partial! 'fhir/base/reference', reference: resource.encounter
end unless resource.encounter.nil?

json.asserter do
  json.partial! 'fhir/base/reference', reference: resource.asserter
end unless resource.asserter.nil?

json.dateRecorded resource.date_recorded unless resource.date_recorded.nil?

json.code do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.code
end unless resource.code.nil?

json.category do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.category
end unless resource.category.nil?

json.clinicalStatus resource.clinical_status unless resource.clinical_status.nil?
json.verificationStatus resource.verification_status unless resource.verification_status.nil?

json.severity do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: resource.severity
end unless resource.severity.nil?

json.onsetDateTime resource.onset_datetime unless resource.onset_datetime.nil?
json.onsetAge resource.onset_age unless resource.onset_age.nil?
json.abatementDateTime resource.abatement_datetime unless resource.abatement_datetime.nil?
json.abatementAge   resource.abatement_age unless resource.abatement_age.nil?
json.abatementBoolean resource.abatement_boolean unless resource.abatement_boolean.nil?

json.stage  do
  json.partial! 'stage', stage: resource.stage
end unless resource.stage.nil?

json.evidence resource.evidence do |evidence|
  json.partial! 'evidence', evidence: evidence
end unless resource.evidence.nil?

json.bodySite resource.body_site do |bodySite|
  json.partial! 'fhir/base/codeable_concept', codeable_concept: bodySite
end unless resource.body_site.nil?

json.notes resource.notes unless resource.notes.nil?
