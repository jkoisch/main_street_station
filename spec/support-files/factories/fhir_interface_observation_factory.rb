FactoryBot.define do
  factory :fhir_observation, class: FhirInterface::Observation do
    skip_create
  end
end