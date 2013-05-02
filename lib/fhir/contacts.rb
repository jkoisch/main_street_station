require_relative '../fhir/details'
require_relative 'codeable_concept'
require_relative 'resource'

module FHIR
  class Contacts

    attr_accessor :details, :organization, :relationships

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def self.parse_json_array(json_dtl)

      unless json_dtl.nil?
          new_contact = self.new()

          new_contact.details = Details.parse_json_array(json_dtl[:details]) unless json_dtl[:details].nil?
          new_contact.organization = Resource.parse_json_array(json_dtl[:organization]) unless json_dtl[:organization].nil?

          new_contact.relationships = []
          json_dtl[:relationship].each {|relationship|
            new_contact.relationship << CodeableConcept.parse_json_array(relationship)
          } unless json_dtl[:relationship].nil?

          return new_contact
      end
    end

  end
end