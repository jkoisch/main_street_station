FactoryGirl.define do
  factory :fhir_type_period, class: FhirInterface::Types::Period do
    skip_create
    start {Date.now - 2.years}
  end

  factory :fhir_type_coding, class: FhirInterface::Types::Coding do
    skip_create

  end

  factory :fhir_type_codeable_concept, class: FhirInterface::Types::CodeableConcept do
    skip_create

  end

  factory :fhir_type_address, class: FhirInterface::Types::Address do
    skip_create
  end

  factory :fhir_type_identifier, class: FhirInterface::Types::Identifier do
    skip_create

    use 'usual'
  end

  factory :fhir_type_human_name, class: FhirInterface::Types::HumanName do
    skip_create

    use 'usual'
    family ['Smith']
    given  ['John']
  end

  factory :fhir_type_contact, class: FhirInterface::Types::Contact do
    skip_create

    system 'email'
    value  'john.smith@somewhere.com'
  end

end