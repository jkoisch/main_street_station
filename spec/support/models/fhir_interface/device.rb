module FhirInterface
  class Device
    attr_accessor :identifier, :type, :manufacturer, :model, :version, :expiry, :udi, :lotNumber, :owner,
                  :location, :patient, :contactPoint, :url
  end
end
