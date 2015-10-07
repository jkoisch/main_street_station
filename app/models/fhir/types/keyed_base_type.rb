module Fhir
  module Types
    class KeyedBaseType < BaseType
      include Fhir::XmlAttributeOutput

      fhir_attribute :_id, include: :none

      def to_xml(tag, builder)
        attrs = {}

        attrs['id'] = _id unless _id.nil?
        builder.tag!(tag, nil, attrs) { |xml|
          generate_xml_output(xml)
        }
      end
    end
  end
end
