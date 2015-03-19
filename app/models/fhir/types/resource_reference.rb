module Fhir
  module Types
    class ResourceReference < BaseType
      fhir_attribute :local_id
      fhir_attribute :local_type
      fhir_attribute :display
      fhir_attribute :external_reference

      def reference
        if external_reference.nil?
          "http://mainstreet.youcentric.com/fhir/#{GringottConversion.from_gringott_type(local_type)}/#{local_id}"
        else
          external_reference
        end
      end
    end
  end
end
