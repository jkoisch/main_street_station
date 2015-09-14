module Fhir
  module Types
    class Reference < BaseType
      fhir_attribute :local_id
      fhir_attribute :local_type
      fhir_attribute :display
      fhir_attribute :external

      def reference
        if external.nil?
          "http://mainstreet.youcentric.com/fhir/#{GringottConversion.from_gringott_type(local_type)}/#{local_id}"
        else
          external
        end
      end
    end
  end
end
