module FhirInterface
  class Practitioner
    attr_accessor :identifier, :name, :telecom, :address, :gender, :birthDate, :organization, :role,
                  :specialty, :period, :location, :communication
  end

  module PractitionerClasses
    class Qualification
      attr_accessor :code, :period, :issuer
    end
  end
end