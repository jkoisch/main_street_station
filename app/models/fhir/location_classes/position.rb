module Fhir
  module LocationClasses
    class Position < BaseClass
      fhir_attribute :longitude
      fhir_attribute :latitude
      fhir_attribute :altitude
    end
  end
end