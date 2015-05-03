module Fhir
  module Types
    class SimpleInteger
      attr_accessor :value

      def self.output_type
        'integer'
      end

      def self.simple_type?
        true
      end
    end
  end
end