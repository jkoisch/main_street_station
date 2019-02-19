FactoryBot.define do
  factory :fhir_location, class: FhirInterface::Location do
    skip_create
  end
end