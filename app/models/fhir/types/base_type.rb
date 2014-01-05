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
    end
  end
end