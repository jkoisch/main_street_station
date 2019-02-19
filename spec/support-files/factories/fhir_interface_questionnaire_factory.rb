FactoryBot.define do
  factory :fhir_questionnaire, class: FhirInterface::Questionnaire do
    skip_create
  end
end