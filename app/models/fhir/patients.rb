module Fhir
  class Patients

    def initialize(attributes = {})
      #@attributes = attributes
    end

    def self.init_from_ember(json_dtl)
      patients = []

      json_dtl[:clients].each do |pnt|
        patients << Patient.init_from_ember(pnt)
      end

      patients
    end

  end
end