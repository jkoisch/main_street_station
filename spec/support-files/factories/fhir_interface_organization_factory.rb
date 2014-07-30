FactoryGirl.define do
  factory :fhir_organization, class: FhirInterface::Organization do
    skip_create
  end
end