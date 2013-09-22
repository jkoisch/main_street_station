require_relative 'codeable_concept'
require_relative 'quantity'

module FHIR
  class ReferenceRange
    attr_accessor :meaning, :range

    def initialize(attributes = {})
    end

    def parse_input(dtl)
      referenceRange = ReferenceRange.new()

      referenceRange.meaning = Codeable_Concept.parse_json_array(dtl[:meaning]) unless dtl[:meaning].nil
      referenceRange.range = Quantity.parse_input(dtl[:range]) unless dtl[:range].nil?

      referenceRange
    end
  end
end