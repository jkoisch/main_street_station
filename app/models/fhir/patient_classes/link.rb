module Fhir
  module PatientClasses
    class Link < BaseClass
      fhir_attribute :other, type: Types::ResourceReference #patient
      fhir_attribute :type
    end
  end
end