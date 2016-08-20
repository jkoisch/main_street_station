module FhirInterface
  class Practitioner
    attr_accessor :identifier, :name, :telecom, :address, :gender, :birthDate, :communication
  end

  module PractitionerClasses
    class Qualification
      attr_accessor :code, :period, :issuer
    end

    class PractitionerRole
      attr_accessor :organization, :role, :specialty, :period, :location, :healthcareService
    end
  end
end