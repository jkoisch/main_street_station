FactoryGirl.define do
  factory :fhir_patient, class: FhirInterface::Patient do
    skip_create

    birthDate {Date.today - 30.years}
    active    true
  end
end