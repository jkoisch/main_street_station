FactoryGirl.define do
  factory :fhir_practitioner, class: FhirInterface::Practitioner do
    skip_create
  end
end