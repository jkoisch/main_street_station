require_relative 'patient'

module FHIR
  class Patients

    #attr_accessor :patient

    def initialize(attributes = {})
    end

    def self.init_from_ember(json_dtl)
      patients = []

      json_dtl[:clients].each { |pnt|
         patients << Patient.init_from_ember(pnt)
      }

      return patients
    end

  end
end