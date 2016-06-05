module FhirInterface
  class Device
    attr_accessor :identifier, :udiCarrier, :status, :type, :lotNumber, :manufacturer,
                  :manufactureDate, :expirationDate, :model, :version, :patient, :owner,
                  :contact, :location, :url, :note
  end
end
