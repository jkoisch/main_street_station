module Fhir
  module XmlAttributeOutput
    def generate_xml_output(xml_builder)
      self.class.get_attr_list.each do |fhir_attr|
        attr_definition = self.class.get_attr_details[fhir_attr]
        if (attr_definition && (attr_definition[:include] == :all || attr_definition[:include] == :xml)) ||
            attr_definition.nil?
          thing = self.send(fhir_attr)
          if thing
            if attr_definition && attr_definition[:type].is_a?(Array)
              klass = thing.class
              if klass.respond_to?(:simple_type?)
                if klass.simple_type?
                  xml_builder.tag!(__xml_tag(fhir_attr, attr_definition, klass), value: __xml_value(thing))
                else
                  thing.to_xml(__xml_tag(fhir_attr, attr_definition, klass), xml_builder)
                end
              else
                xml_builder.tag!(__xml_tag(fhir_attr, attr_definition, klass), value: __xml_value(thing))
              end
            elsif attr_definition.nil? || attr_definition[:type] == :simple || attr_definition[:type].simple_type?
              if attr_definition && attr_definition[:array]
                thing.each do |thing_instance|
                  xml_builder.tag!(__xml_tag(fhir_attr, attr_definition), value: __xml_value(thing_instance))
                end
              else
                xml_builder.tag!(__xml_tag(fhir_attr, attr_definition), value: __xml_value(thing))
              end
            else
              if attr_definition[:array]
                thing.each do |thing_instance|
                  thing_instance.to_xml(__xml_tag(fhir_attr, attr_definition), xml_builder)
                end
              else
                thing.to_xml(__xml_tag(fhir_attr, attr_definition), xml_builder)
              end
            end
          end
        end
      end
    end

    def __xml_tag(attr, definition,type=nil)
      if type
        attr.to_s.camelize(:lower) + type.name.demodulize
      else
        attr.to_s.camelize(:lower)
      end
    end

    def __xml_value(data_object)
      if data_object.is_a?(DateTime) || data_object.is_a?(Time)
        data_object.strftime('%FT%T.%LZ')
      else
        data_object
      end
    end
  end
end