module Fhir
  module Types
    class Coding < BaseType
      fhir_attribute :system
      fhir_attribute :version
      fhir_attribute :code
      fhir_attribute :display
      fhir_attribute :primary
      # TODO: need to resolve value_set
    end
  end
end
