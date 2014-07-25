FactoryGirl.define do
  factory :fhir_device, class: FhirInterface::Device do
    skip_create
  end
end