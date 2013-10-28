module Fhir
  class Device
    attr_accessor :type, :manufacturer, :model, :version, :expiry, 
                  :udi, :lotNumber, :owner, :location, :patient,
                  :contact, :url

    def initialize(attributes = {})
    end

    def self.parse_input(dtl)
      device = device.new()

      device.type = CodeableConcept.parse_json_array(dtl[:type]) unless dtl[:type].nil?
      device.manufacturer = dtl[:manufacturer] unless dtl[:manufacturer].nil?
      device.model =  dtl[:model] unless dtl[:model].nil?
      device.version = dtl[:version] unless dtl[:version].nil?
      device.expiry = dtl[:expiry] unless dtl[:expiry].nil?
      device.udi = dtl[:udi] unless dtl[:udi].nil?
      device.lotNumber = dtl[:lotNumber] unless dtl[:lotNumber].nil?
      device.owner = Resource.parse_json_array(dtl[:owner]) unless dtl[:owner].nil?

      dtl[:assignedId].each do |assignedId|
        device.assignedId = Indentifiers.parse_json_array(assignedId)
      end unless dtl[:assignedId].nil?

      device.location = Resource.parse_json_array(dtl[:location]) unless dtl[:location].nil?
      device.patient = Resource.parse_json_array(dtl[:patient]) unless dtl[:patient].nil?

      dtl[:contact].each do |contact|
        device.contact = Contacts.parse_json_array(contact)
      end unless dtl[:contact].nil?

      device.url = dtl[:url] unless dtl[:url].nil?

      device
    end

  end
end