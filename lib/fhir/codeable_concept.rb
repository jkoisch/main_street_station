require_relative '../fhir/coding'

module FHIR
  class CodeableConcept

    attr_accessor :coding, :text, :primary

    def initialize(attributes={})
    end

    def self.parse_json_array(dtl)

      unless dtl.nil?
        concepts = []

        new_concept = CodeableConcept.new()

        dtl[:coding].each do |item|
          new_concept.coding = Coding.parse_json_array(item)
        end unless dtl[:coding].nil?

        #dtl[:coding].each_with_index do |item, index|
        #  new_concept.coding = Coding.parse_json_array(item)
        #end unless dtl[:coding].nil?

        new_concept.primary = dtl[:primary] unless dtl[:primary].nil?
        new_concept.text = dtl[:text] unless dtl[:text].nil?

        concepts << new_concept
      end
    end

  end
end