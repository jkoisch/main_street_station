module Fhir
  module Types
    class SimpleTime
      def self.output_type
        'time'
      end

      def self.simple_type?
        true
      end
    end
  end
end