module Fhir
  class ReferenceRange
    attr_accessor :meaning, :range

    def initialize(attributes = {})
    end

    def parse_input(dtl)
      reference_Range = ReferenceRange.new()

      reference_Range.meaning = Codeable_Concept.parse_json_array(dtl[:meaning]) unless dtl[:meaning].nil
      reference_Range.range = Quantity.parse_input(dtl[:range]) unless dtl[:range].nil?

      reference_Range
    end
  end
end