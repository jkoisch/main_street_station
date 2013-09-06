require_relative '../fhir/coding'

module FHIR
  class CodeableConcept

    attr_accessor :coding, :text, :primary

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?
        concepts = []

        new_concept = CodeableConcept.new()

        json_dtl[:coding].each do |item|
          new_concept.coding = Coding.parse_json_array(item)
        end unless json_dtl[:coding].nil?

        #json_dtl[:coding].each_with_index do |item, index|
        #  new_concept.coding = Coding.parse_json_array(item)
        #end unless json_dtl[:coding].nil?

        new_concept.primary = json_dtl[:primary] unless json_dtl[:primary].nil?
        new_concept.text = json_dtl[:text] unless json_dtl[:text].nil?

        concepts << new_concept
      end
    end

  end
end