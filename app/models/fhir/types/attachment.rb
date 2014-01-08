module Fhir
  module Types
    class Attachment < BaseType
      fhir_attribute :content_type
      fhir_attribute :language
      fhir_attribute :data
      fhir_attribute :url
      fhir_attribute :size
      fhir_attribute :hash
      fhir_attribute :title
    end
  end
end