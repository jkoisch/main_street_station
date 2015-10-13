module Fhir
  module Types
    class Meta < KeyedBaseType
      fhir_attribute :version_id
      fhir_attribute :last_updated
      fhir_attribute :profile, array: true
      fhir_attribute :security, list: Fhir::Types::Coding
      fhir_attribute :tag, list: Fhir::Types::Coding
    end
  end
end
