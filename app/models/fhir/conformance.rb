module Fhir
  class Conformance < BaseResource
    fhir_attribute :identifier
    fhir_attribute :version
    fhir_attribute :name
    fhir_attribute :publisher
    fhir_attribute :telecom, list: Types::Contact
    fhir_attribute :description
    fhir_attribute :status
    fhir_attribute :experimental
    fhir_attribute :date
    fhir_attribute :fhir_version
    fhir_attribute :accept_unknown
    fhir_attribute :format
    # TODO: Need resource reference to Profile
    fhir_attribute :software, type: ConformanceClasses::Software
    fhir_attribute :implementation, type: ConformanceClasses::Implementation
    fhir_attribute :rest, list: ConformanceClasses::Rest
  end
end
