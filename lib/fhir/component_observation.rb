require_relative 'codeable_concept'
require_relative 'quantity'
module FHIR
  class ComponentObservation
    attr_accessor :name, :value

    def initialize(attributes = {})
    end

    def parse_input(dtl)
      componentObservation = ComponentObservation.new()

      componentObservation.name = Codeable_Concept.parse_json_array(dtl[:name]) unless dtl[:name].nil
      componentObservation.value = Quantity.parse_input(dtl[:range]) unless dtl[:range].nil?

      componentObservation
    end
  end
end