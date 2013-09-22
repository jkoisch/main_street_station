require_relative 'codeable_concept'
require_relative 'contacts'
require_relative 'identifiers'
require_relative 'resource'

module FHIR
  class Devise
    attr_accessor :type, :manufacturer, :model, :version, :expiry, :identity,
                  :gtin, :lot, :serialNumber, :owner, :assignedId, :location,
                  :patient, :contact, :url

    def initialize(attributes = {})
    end

    def self.parse_input(dtl)
      devise = Devise.new()

      devise.type = CodeableConcept.parse_json_array(dtl[:type]) unless dtl[:type].nil?
      devise.manufacturer = dtl[:manufacturer] unless dtl[:manufacturer].nil?
      devise.model =  dtl[:model] unless dtl[:model].nil?
      devise.version = dtl[:version] unless dtl[:version].nil?
      devise.expiry = dtl[:expiry] unless dtl[:expiry].nil?

      #unless dtl[:identity].nil?
      #end

      devise.owner = Resource.parse_json_array(dtl[:owner]) unless dtl[:owner].nil?

      dtl[:assignedId].each do |assignedId|
        devise.assignedId = Indentifiers.parse_json_array(assignedId)
      end unless dtl[:assignedId].nil?

      #unless dtl[:assignedId].nil?
      #  devise.assignedId = []
      #  dtl[:assignedId].each {|assignedId|
      #    devise.assignedId << Identifiers.parse_json_array(assignedId)
      #  }
      #end

      devise.location = Resource.parse_json_array(dtl[:location]) unless dtl[:location].nil?
      devise.patient = Resource.parse_json_array(dtl[:patient]) unless dtl[:patient].nil?

      dtl[:contact].each do |contact|
        devise.contact = Contacts.parse_json_array(contact)
      end unless dtl[:contact].nil?

      devise.url = dtl[:url] unless dtl[:url].nil?

      devise
    end

  end
end