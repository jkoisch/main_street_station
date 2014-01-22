module Fhir
  module Types
    class Contact < KeyedBaseType
      fhir_attribute :system
      fhir_attribute :value
      fhir_attribute :use
      fhir_attribute :period, type: Period
    end
  end
end
