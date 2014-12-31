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
    fhir_attribute :software, type: Fhir::ConformanceClasses::Software
    fhir_attribute :implementation, type: Fhir::ConformanceClasses::Implementation
    fhir_attribute :fhir_version
    fhir_attribute :accept_unknown
    fhir_attribute :format
    fhir_attribute :profile, list: Types::ResourceReference #Profile
    fhir_attribute :rest, list: Fhir::ConformanceClasses::Rest
    fhir_attribute :messaging, list: Fhir::ConformanceClasses::Messaging
    fhir_attribute :document, list: Fhir::ConformanceClasses::Document
  end
end
