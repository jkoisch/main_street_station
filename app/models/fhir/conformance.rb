module Fhir
  class Conformance < BaseResource
    fhir_attribute :url
    fhir_attribute :version
    fhir_attribute :name
    fhir_attribute :status
    fhir_attribute :experimental
    fhir_attribute :publisher
    fhir_attribute :contact, list: Types::ConformanceClasses::Contact
    fhir_attribute :date
    fhir_attribute :description
    fhir_attribute :requirements
    fhir_attribute :copyright
    fhir_attribute :kind
    fhir_attribute :software, type: Fhir::ConformanceClasses::Software
    fhir_attribute :implementation, type: Fhir::ConformanceClasses::Implementation
    fhir_attribute :fhir_version
    fhir_attribute :accept_unknown
    fhir_attribute :format, array: true
    fhir_attribute :profile, list: Types::Reference #Profile
    fhir_attribute :rest, list: Fhir::ConformanceClasses::Rest
    fhir_attribute :messaging, list: Fhir::ConformanceClasses::Messaging
    fhir_attribute :document, list: Fhir::ConformanceClasses::Document
  end
end
