module Fhir
  class Component_Observation

    attr_accessor :name, :valueQuantity

    def initialize(attributes = {})
    end

    def self.parse_input(dtl)
      component = Component_Observation.new()

      component.name = CodeableConcept.parse_json_array(dtl[:name]) unless dtl[:name].nil?

      unless dtl[:value].nil?
        case dtl[:value][:_data_type]
          when 'Quantity'
            then component.valueQuantity = Quantity.parse_input(dtl[:value]) unless dtl[:value].nil?
          else 'nothing'
        end
      end

      component
    end
  end
end