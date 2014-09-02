module FhirInterface
  class Location
    attr_accessor :identifier, :name, :description, :type, :telecom, :address, :physicalType,
                  :position, :managingOrganization, :status, :partOf, :mode
  end

  module LocationClasses
    class Position
      attr_accessor :longitude, :latitude, :altitude
    end
  end
end
