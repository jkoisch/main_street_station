module Fhir
  class BaseClass
    extend AttributeDefs
    include Fhir::XmlAttributeOutput

    fhir_attribute :id
    fhir_attribute :extension, list: Fhir::Types::Extension
    fhir_attribute :modifier_extension, list: Fhir::Types::Extension

    def initialize(attr_accessors={})
      update(attr_accessors)
    end

    def update(attr_values)
      attr_values.each do |name, value|
        send("#{name}=", value)
      end
    end

    def to_xml(tag, builder)
      builder.tag!(tag) { |xml|
        generate_xml_output(xml)
      }
    end

    def self.simple_type?
      false
    end
  end
end