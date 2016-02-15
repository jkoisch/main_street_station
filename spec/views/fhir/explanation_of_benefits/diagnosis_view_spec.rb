require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Diagnosis', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/diagnosis-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/diagnosis', formats: :json, locals: {diagnosis: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/diagnosis-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('diagnosis', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/diagnosis-standard.xml')) }
      end
    end
  end
end