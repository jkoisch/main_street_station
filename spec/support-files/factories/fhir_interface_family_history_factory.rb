FactoryGirl.define do
  factory :fhir_family_history, class: FhirInterface::FamilyHistory do
    skip_create
  end
end