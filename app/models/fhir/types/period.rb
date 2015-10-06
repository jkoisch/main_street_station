module Fhir
  module Types
    class Period < BaseType
      fhir_attribute :start
      fhir_attribute :end

      def to_xml(tag, builder)
        builder.tag!(tag) { |xml|
          xml.start(value: start) unless start.nil?
          xml.end(value: self.end) unless self.end.nil?
        }
      end
    end
  end
end
