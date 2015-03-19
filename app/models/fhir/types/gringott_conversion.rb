module Fhir
  module Types
    class GringottConversion
      def self.from_gringott_type(gringott_type)
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

      def self.to_gringott_type(fhir_type)
        case fhir_type
          when /patient/i then 'Client'
          when /practitioner/i then 'Provider'
          else
            if fhir_type
              fhir_type.capitalize
            else
              nil
            end
        end
      end
    end
  end
end
