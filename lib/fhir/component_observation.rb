require_relative 'codeable_concept'
require_relative 'quantity'

module FHIR
  class ComponentObservation
    attr_accessor :name, :value

    def initialize(attributes = {})
    end

    def parse_input(dtl)
      component_Observation = ComponentObservation.new()

      component_Observation.name = Codeable_Concept.parse_json_array(dtl[:name]) unless dtl[:name].nil
      component_Observation.value = Quantity.parse_input(dtl[:range]) unless dtl[:range].nil?

      component_Observation
    end
  end
end