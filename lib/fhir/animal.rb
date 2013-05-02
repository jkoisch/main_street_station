require_relative '../fhir/codeable_concept'

module FHIR
  class Animal

    attr_accessor :breed, :genderStatus, :species

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def parse_json_array(json_dtl)
      animal = self.new()

      animal.breed = CodeableConcept.parse_json_array(json_dtl[:breed]) unless json_dtl[:breed].nil?
      animal.genderStatus = Codeable_Concept.parse_json_array(json_dtl[:genderStatus]) unless json_dtl[:genderStatus].nil?
      animal.species = Codeable_Concept.parse_json_array(json_dtl[:species]) unless json_dtl[:species].nil?

      animal
    end

  end
end