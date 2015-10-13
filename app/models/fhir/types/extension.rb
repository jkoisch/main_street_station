module Fhir
  module Types
    class Extension < BaseType
      fhir_attribute :url, include: :none
      fhir_attribute :value, type_list: [Types::SimpleBoolean, Types::SimpleDate, Types::SimpleDatetime,
                                         Types::SimpleInteger, Types::SimpleTime, Types::Annotation,
                                         Types::Address, Types::Attachment, Types::CodeableConcept,
                                         Types::Coding, Types::ContactPoint, Types::HumanName,
                                         Types::Identifier, Types::Period, Types::Quantity,
                                         Types::Range, Types::Ratio, Types::Reference
                                        ]

      def to_xml(tag, builder)
        builder.tag!(tag, url: url) { |xml|
          generate_xml_output(xml)
        }
      end
    end
  end
end
