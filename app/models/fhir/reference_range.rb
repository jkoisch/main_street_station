module Fhir
  class ReferenceRange
    attr_accessor :meaning, :range

    def initialize(attributes = {})
    end

    def parse_input(dtl)
      reference_range = ReferenceRange.new

      reference_range.meaning = Codeable_Concept.parse_json_array(dtl[:meaning]) unless dtl[:meaning].nil
      reference_range.range = Quantity.parse_input(dtl[:range]) unless dtl[:range].nil?

      reference_range
    end
  end
end