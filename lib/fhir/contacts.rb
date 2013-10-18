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
          contact = self.new()

          #contact.details = Details.parse_json_array(json_dtl[:details]) unless json_dtl[:details].nil?

          contact.relationships = []
          json_dtl[:relationship].each {|relationship|
            contact.relationship << CodeableConcept.parse_json_array(relationship)
          } unless json_dtl[:relationship].nil?

          contact.name = HumanName.parse_json_array(json_dtl[:name]) unless json_dtl[:name].nil?

          unless json_dtl[:telecom].nil? || json_dtl[:telecom].empty?
            contact.telecoms = []
            json_dtl[:telecom].each {|telecom|
              contact.telecoms << TelecomContacts.parse_json_array(telecom)
            }
          end

          unless json_dtl[:address].nil? || json_dtl[:address].empty?
            contact.addresses = []
            json_dtl[:address].each {|addr|
              contact.addresses << Address.parse_json_array(addr)
            }
          end

          #todo fhir def has CodeableConcept, examples have coding type
          unless json_dtl[:gender][:system].nil? && json_dtl[:gender][:code].nil? && json_dtl[:gender][:display].nil?
            #contact.gender = Gender.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
            contact.gender = CodeableConcept.parse_json_array(json_dtl[:gender]) unless json_dtl[:gender].nil?
          end

          contact.organization = Resource.parse_json_array(json_dtl[:organization]) unless json_dtl[:organization].nil?

          contact
      end
    end

  end
end