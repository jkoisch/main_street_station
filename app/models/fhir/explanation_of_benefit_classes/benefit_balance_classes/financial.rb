module Fhir
  module ExplanationOfBenefitClasses
    module BenefitBalanceClasses
      class Financial < BaseClass
        fhir_attribute :type, type: Types::Coding
        fhir_attribute :benefit, type_list: [Types::SimpleInteger, Types::Quantity]
        fhir_attribute :benefit_used, type_list: [Types::SimpleInteger, Types::Quantity]
      end
    end
  end
end