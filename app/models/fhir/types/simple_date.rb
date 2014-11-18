module Fhir
  module Types
    class SimpleDate
      def self.output_type
        'date'
      end

      def self.simple_type?
        true
      end
    end
  end
end