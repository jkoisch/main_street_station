module Fhir
  module ConformanceClasses
    class Resource < BaseClass
      fhir_attribute :type
      fhir_attribute :read_history

      def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value)
        end
      end
    end
  end
end
