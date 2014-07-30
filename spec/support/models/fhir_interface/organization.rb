module FhirInterface
  class Organization
    attr_accessor :identifier, :name, :type, :telecom, :address, :partOf, :location, :active
  end

  module OrganizationClasses
    class Contact
      attr_accessor :purpose, :name, :telecom, :address, :gender
    end
  end
end