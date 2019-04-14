require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Coverage', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/coverage-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/coverage', formats: :fhirj, locals: {coverage: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/coverage-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('coverage', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/coverage-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/coverage-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/coverage', formats: :fhirj, locals: {coverage: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/coverage-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('coverage', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/coverage-complete.xml')) }
      end
    end
  end
end