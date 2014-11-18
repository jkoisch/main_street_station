module Fhir
  module Types
    class SimpleString
      def self.output_type
        'string'
      end

      def self.simple_type?
        true
      end
    end
  end
end