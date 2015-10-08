module Fhir
  class Patient < BaseResource
    fhir_attribute :identifier, list: Types::Identifier
    fhir_attribute :active
    fhir_attribute :name, list: Types::HumanName
    fhir_attribute :telecom, list: Types::ContactPoint
    fhir_attribute :gender
    fhir_attribute :birth_date
    fhir_attribute :deceased, type_list: [Types::SimpleBoolean, Types::SimpleDatetime]
    fhir_attribute :address, list: Types::Address
    fhir_attribute :marital_status, type: Types::CodeableConcept
    fhir_attribute :multiple_birth, type_list: [Types::SimpleBoolean, Types::SimpleInteger]
    fhir_attribute :photo, list: Types::Attachment
    fhir_attribute :contact, list: PatientClasses::Contact
    fhir_attribute :communication, list: PatientClasses::Communication
    fhir_attribute :care_provider, list: Types::Reference #Organization/Practitioner
    fhir_attribute :managing_organization, type: Types::Reference
    fhir_attribute :link, list: PatientClasses::Link

    def self.search_patient(search_params)
      supported_params = [:name]

      if search_params[:id] == 'search'
        conditions = {}
        search_params.slice(*supported_params).each do |scope, value|
        conditions[scope] = value
        end
      elsif search_params[:id] =~ /\D\d[0-9]{,36}\D/

      end
    end
  end
end



