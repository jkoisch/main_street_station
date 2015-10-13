module Fhir
  module Types
    class Reference < BaseType
      fhir_attribute :local_id, include: :none
      fhir_attribute :local_type, include: :none
      fhir_attribute :reference, placeholder: true
      fhir_attribute :display
      fhir_attribute :external, include: :none

      def reference
        if external.nil?
          "#{GringottConversion.from_gringott_type(local_type)}/#{local_id}"
        else
          external
        end
      end
    end
  end
end
