module Fhir
  module Types
    class BaseType
      extend Fhir::AttributeDefs
      include Fhir::XmlAttributeOutput

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

      def to_xml(tag, builder)
        builder.tag!(tag) { |xml|
          generate_xml_output(xml)
        }
      end
    end
  end
end