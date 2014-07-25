FactoryGirl.define do
  factory :fhir_condition, class: FhirInterface::Condition do
    skip_create
  end
end