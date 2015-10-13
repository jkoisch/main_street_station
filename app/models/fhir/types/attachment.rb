module Fhir
  module Types
    class Attachment < KeyedBaseType
      fhir_attribute :content_type
      fhir_attribute :language
      fhir_attribute :data
      fhir_attribute :url
      fhir_attribute :size
      fhir_attribute :hash
      fhir_attribute :title
      fhir_attribute :creation
    end
  end
end