require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit MissingTeeth', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/missing_teeth-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/missing_teeth', formats: :fhirj, locals: {missing_teeth: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/missing_teeth-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('missing_teeth', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/missing_teeth-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/missing_teeth-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/missing_teeth', formats: :fhirj, locals: {missing_teeth: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/missing_teeth-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('missing_teeth', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/missing_teeth-complete.xml')) }
      end
    end
  end
end