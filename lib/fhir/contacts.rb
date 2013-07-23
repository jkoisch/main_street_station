require_relative '../fhir/details'
require_relative 'codeable_concept'
require_relative 'resource'
require_relative 'human_name'

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

          #new_contact.details = Details.parse_json_array(json_dtl[:details]) unless json_dtl[:details].nil?

          new_contact.relationships = []
          json_dtl[:relationship].each {|relationship|
            new_contact.relationship << CodeableConcept.parse_json_array(relationship)
          } unless json_dtl[:relationship].nil?

          new_contact.name = HumanName.parse_json_array(json_dtl[:name]) unless json_dtl[:name].nil?

          unless json_dtl[:telecom].nil? || json_dtl[:telecom].empty?
            new_contact.telecoms = []
            json_dtl[:telecom].each {|telecom|
              new_contact.telecoms << TelecomContacts.parse_json_array(telecom)
            }
          end

          unless json_dtl[:address].nil? || json_dtl[:address].empty?
            new_contact.addresses = []
            json_dtl[:address].each {|addr|
              new_contact.addresses << Address.parse_json_array(addr)
            }
          end

          #todo fhir def has CodeableConcept, examples have coding type
          unless json_dtl[:gender][:system].nil? && json_dtl[:gender][:code].nil? && json_dtl[:gender][:display].nil?
            #new_contact.gender = Gender.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
            new_contact.gender = CodeableConcept.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
          end

          new_contact.organization = Resource.parse_json_array(json_dtl[:organization]) unless json_dtl[:organization].nil?

          return new_contact
      end
    end

  end
end