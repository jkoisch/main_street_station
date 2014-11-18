module Fhir
  module Types
    class SimpleBoolean
      def self.output_type
        'boolean'
      end

      def self.simple_type?
        true
      end
    end
  end
end