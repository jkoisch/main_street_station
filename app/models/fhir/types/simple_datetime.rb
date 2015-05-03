module Fhir
  module Types
    class SimpleDatetime
      def self.output_type
        'datetime'
      end

      def self.simple_type?
        true
      end
    end
  end
end