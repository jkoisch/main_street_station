require_relative '../fhir/coding'

module FHIR
  class CodeableConcept

    attr_accessor :coding, :text, :primary

    def initialize(attributes={})
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?
        concepts = []

        json_dtl.each do |detail|
          new_concept = CodeableConcept.new()

          new_concept.coding = Coding.parse_json_array(detail[:coding]) unless detail[:coding].nil?
          new_concept.primary = detail[:primary] unless detail[:primary].nil?
          new_concept.text = detail[:text] unless detail[:text].nil?

          concepts << new_concept
        end
      end
    end

  end
end