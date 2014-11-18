module Fhir
  module Types
    class BaseType
      extend Fhir::AttributeDefs

      def initialize(attr_accessors={})
        update(attr_accessors)
      end

      def update(attr_values)
        attr_values.each do |name, value|
          send("#{name}=", value)
        end
      end

      def ehmbr__type=(thing)
        # eat the _type attribute
      end

      def self.simple_type?
        false
      end
    end
  end
end