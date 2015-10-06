module Fhir
  module Types
    class HumanName < KeyedBaseType
      fhir_attribute :use
      fhir_attribute :text
      fhir_attribute :family, array: true
      fhir_attribute :given, array: true
      fhir_attribute :prefix, array: true
      fhir_attribute :suffix, array: true
      fhir_attribute :period, type: Period

      def to_xml(tag, builder)
        attrs = {}

        attrs['id'] = _id unless _id.nil?
        builder.tag!(tag, nil, attrs) { |xml|
          xml.use(value: use) unless use.nil?
          xml.text(value: text) unless text.nil?
          if family
            family.each do |instance|
              xml.family(value: instance)
            end
          end
          if given
            given.each do |instance|
              xml.given(value: instance)
            end
          end
          if prefix
            prefix.each do |instance|
              xml.prefix(value: instance)
            end
          end
          if suffix
            suffix.each do |instance|
              xml.suffix(value: instance)
            end
          end
          period.to_xml('period', xml) if period
        }
      end
    end
  end
end