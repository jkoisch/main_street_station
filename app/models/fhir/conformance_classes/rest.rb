module Fhir
  module ConformanceClasses
    class Rest < BaseClass
      fhir_attribute :mode
      fhir_attribute :resource, list: ConformanceClasses::Resource

      def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value)
        end
      end
    end
  end
end