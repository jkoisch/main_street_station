module Fhir
  module ExplanationOfBenefitClasses
    module ItemClasses
      class Prosthesis < BaseClass
        fhir_attribute :initial
        fhir_attribute :prior_date
        fhir_attribute :prior_material, type: Types::Coding
      end
    end
  end
end