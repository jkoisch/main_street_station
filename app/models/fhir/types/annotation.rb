module Fhir
  module Types
    class Annotation < KeyedBaseType
      fhir_attribute :author, type_list: [Types::SimpleString, Types::Reference]
      fhir_attribute :time
      fhir_attribute :text
    end
  end
end