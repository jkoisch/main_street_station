module Fhir
  module Types
    class GringottConversion
      def self.from_gringott_type(gringott_type)
        case gringott_type
          when /client/i then 'Patient'
          when /provider/i then 'Practitioner'
          when /familyhistory/i then 'FamilyMemberHistory'
          else
            gringott_type
        end
      end

      def self.to_gringott_type(fhir_type)
        case fhir_type
          when /patient/i then 'Client'
          when /practitioner/i then 'Provider'
          when /familymemberhistory/i then 'FamilyHistory'
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
