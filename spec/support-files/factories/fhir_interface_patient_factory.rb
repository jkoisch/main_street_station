FactoryGirl.define do
  factory :fhir_patient, class: FhirInterface::Patient do
    skip_create

    birthDate {Date.today - 30.years}
    active    true

  end

  factory :fhir_patient_name, class: FhirInterface::Types::HumanName do
    skip_create

    givenName [ 'John' ]
  end
end