json.resourceType  'ExplanationOfBenefit'

json.id resource.id unless resource.id.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.claim do
  json.partial! 'fhir/base/reference', reference: resource.claim
end unless resource.claim.nil?

json.claimResponse do
  json.partial! 'fhir/base/reference', reference: resource.claim_response
end unless resource.claim_response.nil?

json.ruleset do
  json.partial! 'fhir/base/coding', coding: resource.ruleset
end unless resource.ruleset.nil?

json.originalRuleset do
  json.partial! 'fhir/base/coding', coding: resource.original_ruleset
end unless resource.original_ruleset.nil?

json.created resource.created unless resource.created.nil?
json.disposition resource.disposition unless resource.disposition.nil?

json.provider do
  json.partial! 'fhir/base/reference', reference: resource.provider
end unless resource.provider.nil?

json.organization do
  json.partial! 'fhir/base/reference', reference: resource.organization
end unless resource.organization.nil?

json.facility do
  json.partial! 'fhir/base/reference', reference: resource.facility
end unless resource.facility.nil?

json.relatedClaim resource.related_claim do |related_claim|
  json.partial! 'fhir/base/reference', reference: related_claim
end unless resource.related_claim.nil?

json.prescription do
  json.partial! 'fhir/base/reference', reference: resource.prescription
end unless resource.prescription.nil?

json.originalPrescription do
  json.partial! 'fhir/base/reference', reference: resource.original_prescription
end unless resource.original_prescription.nil?

json.payee do
  json.partial! 'payee', payee: resource.payee
end unless resource.payee.nil?

json.referral do
  json.partial! 'fhir/base/reference', reference: resource.referral
end unless resource.referral.nil?

json.diagnosis resource.diagnosis do |diagnosis|
  json.partial! 'diagnosis', diagnosis: diagnosis
end unless resource.diagnosis.nil?

json.specialCondition resource.special_condition do |condition|
  json.partial! 'fhir/base/coding', coding: condition
end unless resource.special_condition.nil?

json.patient do
  json.partial! 'fhir/base/reference', reference: resource.patient
end unless resource.patient.nil?

json.precedence resource.precedence unless resource.precedence.nil?

json.coverage do
  json.partial! 'coverage', coverage: resource.coverage
end unless resource.coverage.nil?

json.exception resource.exception do |exception|
  json.partial! 'fhir/base/coding', coding: exception
end unless resource.exception.nil?

json.school resource.school unless resource.school.nil?
json.accidentDate resource.accident_date unless resource.accident_date.nil?

json.accidentType do
  json.partial! 'fhir/base/coding', coding: resource.accident_type
end unless resource.accident_type.nil?

json.accidentLocationAddress do
  json.partial! 'fhir/base/address', address: resource.accident_location_address
end unless resource.accident_location_address.nil?

json.accidentLocationReference do
  json.partial! 'fhir/base/reference', reference: resource.accident_location_reference
end unless resource.accident_location_reference.nil?

json.interventionException resource.intervention_exception do |exception|
  json.partial! 'fhir/base/coding', coding: exception
end unless resource.intervention_exception.nil?

json.onsetDate resource.onset_date unless resource.onset_date.nil?

json.onsetPeriod do
  json.partial! 'fhir/base/period', period: resource.onset_period
end unless resource.onset_period.nil?

json.employmentImpacted do
  json.partial! 'fhir/base/period', period: resource.employment_impacted
end unless resource.employment_impacted.nil?

json.hospitalization do
  json.partial! 'fhir/base/period', period: resource.hospitalization
end unless resource.hospitalization.nil?

json.item resource.item do |item|
  json.partial! 'item', item: item
end unless resource.item.nil?

json.addItem resource.add_item do |item|
  json.partial! 'add_item', add_item: item
end unless resource.add_item.nil?

json.claimTotal do
  json.partial! 'fhir/base/quantity', quantity: resource.claim_total
end unless resource.claim_total.nil?

json.missingTeeth resource.missing_teeth do |teeth|
  json.partial! 'missing_teeth', missing_teeth: teeth
end unless resource.missing_teeth.nil?

json.unallocDeductible do
  json.partial! 'fhir/base/quantity', quantity: resource.unalloc_deductible
end unless resource.unalloc_deductible.nil?

json.totalBenefit do
  json.partial! 'fhir/base/quantity', quantity: resource.total_benefit
end unless resource.total_benefit.nil?

json.paymentAdjustment do
  json.partial! 'fhir/base/quantity', quantity: resource.payment_adjustment
end unless resource.payment_adjustment.nil?

json.paymentAdjustmentReason do
  json.partial! 'fhir/base/coding', coding: resource.payment_adjustment_reason
end unless resource.payment_adjustment_reason.nil?

json.paymentDate resource.payment_date unless resource.payment_date.nil?

json.paymentAmount do
  json.partial! 'fhir/base/quantity', quantity: resource.payment_amount
end unless resource.payment_amount.nil?

json.paymentRef do
  json.partial! 'fhir/base/identifier', identifier: resource.payment_ref
end unless resource.payment_ref.nil?

json.reserved do
  json.partial! 'fhir/base/coding', coding: resource.reserved
end unless resource.reserved.nil?

json.form do
  json.partial! 'fhir/base/coding', coding: resource.form
end unless resource.form.nil?

json.note resource.note do |note|
  json.partial! 'note', note: note
end unless resource.note.nil?

json.benefitBalance resource.benefit_balance do |balance|
  json.partial! 'benefit_balance', benefit_balance: balance
end unless resource.benefit_balance.nil?