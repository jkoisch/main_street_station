module Fhir
  class BaseResource
    extend AttributeDefs
    include XmlAttributeOutput

    fhir_attribute :id
    fhir_attribute :meta
    fhir_attribute :text
    fhir_attribute :contained, list: Fhir::BaseResource
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

    def to_partial_path
      self.class.name.split('::').last.underscore
    end

    # noinspection RubyUnusedLocalVariable
    def ehmbr_resource_type=(content)
      # Just eat the contents, might wish to validate in future
    end

    def to_xml(tag, builder, include_ns=false)
      attrs = include_ns ? {xmlns: 'http://hl7.org/fhir'} : {}

      builder.tag!(self.class.name.demodulize, nil, attrs) {  |xml|
        generate_xml_output(xml)
      }
    end
  end
end
