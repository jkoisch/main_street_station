require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Adjudication', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/adjudication-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/adjudication', formats: :fhirj, locals: {adjudication: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/adjudication-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('adjudication', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/adjudication-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/adjudication-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/adjudication', formats: :fhirj, locals: {adjudication: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/adjudication-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('adjudication', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/adjudication-complete.xml')) }
      end
    end
  end
end