module Fhir
  class ExplanationOfBenefit < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :claim, type: Types::Reference
    fhir_attribute :claim_response, type: Types::Reference
    fhir_attribute :ruleset, type: Types::Coding
    fhir_attribute :original_ruleset, type: Types::Coding
    fhir_attribute :created
    fhir_attribute :disposition
    fhir_attribute :provider, type: Types::Reference
    fhir_attribute :organization, type: Types::Reference
    fhir_attribute :facility, type: Types::Reference
    fhir_attribute :related_claim, list: Types::Reference
    fhir_attribute :prescription, type: Types::Reference
    fhir_attribute :original_prescription, type: Types::Reference
    fhir_attribute :payee, type: Fhir::ExplanationOfBenefitClasses::Payee
    fhir_attribute :referral, type: Types::Reference
    fhir_attribute :diagnosis, list: Fhir::ExplanationOfBenefitClasses::Diagnosis
    fhir_attribute :special_condition, list: Types::Coding
    fhir_attribute :patient, type: Types::Reference
    fhir_attribute :precedence
    fhir_attribute :coverage, type: Fhir::ExplanationOfBenefitClasses::Coverage
    fhir_attribute :exception, list: Types::Coding
    fhir_attribute :school
    fhir_attribute :accident_date
    fhir_attribute :accident_type, type: Types::Coding
    fhir_attribute :accident_location, type_list: [Types::Address, Types::Reference]
    fhir_attribute :intervention_exception, list: Types::Coding
    fhir_attribute :onset, type_list: [Types::SimpleDate, Types::Period]
    fhir_attribute :employment_impacted, type: Types::Period
    fhir_attribute :hospitalization, type: Types::Period
    fhir_attribute :item, list: Fhir::ExplanationOfBenefitClasses::Item
    fhir_attribute :add_item, list: Fhir::ExplanationOfBenefitClasses::AddItem
    fhir_attribute :claim_total, type: Types::Quantity
    fhir_attribute :missing_teeth, list: Fhir::ExplanationOfBenefitClasses::MissingTeeth
    fhir_attribute :unalloc_deductible, type: Types::Quantity
    fhir_attribute :total_benefit, type: Types::Quantity
    fhir_attribute :payment_adjustment, type: Types::Quantity
    fhir_attribute :payment_adjustment_reason, type: Types::Coding
    fhir_attribute :payment_date
    fhir_attribute :payment_amount, type: Types::Quantity
    fhir_attribute :payment_ref, type: Types::Identifier
    fhir_attribute :reserved, type: Types::Coding
    fhir_attribute :form, type: Types::Coding
    fhir_attribute :note, list: Fhir::ExplanationOfBenefitClasses::Note
    fhir_attribute :benefit_balance, list: Fhir::ExplanationOfBenefitClasses::BenefitBalance
  end
end