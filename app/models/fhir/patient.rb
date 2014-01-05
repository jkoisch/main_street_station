module Fhir
  class Patient < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :name, list: Types::HumanName
    fhir_attribute :telecom, list: Types::Contact
    fhir_attribute :gender, type: Types::CodeableConcept
    fhir_attribute :birth_date
    fhir_attribute :deceased_boolean
    fhir_attribute :deceased_datetime
    fhir_attribute :address, list: Types::Address
    fhir_attribute :marital_status, type: Types::CodeableConcept
    fhir_attribute :multiple_birth
    # TODO: Should Photo attribute be added?
    fhir_attribute :communication, type: Types::CodeableConcept
    # TODO: Reference to careProvider resource
    # TODO: Reference to managingOrganization (Organization) resource
    fhir_attribute :active
    fhir_attribute :contact, list: PatientClasses::Contact

    def self.search_patient(search_params)
      supported_params = [:name]

      if search_params[:id] == "search"
        conditions = {}
        search_params.slice(*supported_params).each do |scope, value|
        conditions[scope] = value
        end
      elsif search_params[:id] =~ /^(@\d{1,36}+$)/

      end
    end
  end
end



