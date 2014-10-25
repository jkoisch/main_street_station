module Fhir
  module Types
    class ResourceReference < BaseType
      # TODO - Add method to determine local type
      fhir_attribute :local_id
      fhir_attribute :local_type
      #fhir_attribute :reference
      fhir_attribute :display
      fhir_attribute :external_reference

      def reference
        if external_reference.nil?
          "http://mainstreet.youcentric.com/fhir/#{gringott_type_translation(local_type)}/#{local_id}}"
        else
          external_reference
        end
      end

      def gringott_type_translation(gringott_type)
        case gringott_type
          when /client/i then 'Patient'
          when /provider/i then 'Practitioner'
          else
            if gringott_type
              gringott_type.capitalize
            else
              nil
            end
        end
      end
    end
  end
end
