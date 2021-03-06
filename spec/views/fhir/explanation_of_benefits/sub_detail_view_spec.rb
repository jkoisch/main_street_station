require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit SubDetail', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/sub_detail-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/sub_detail', formats: :fhirj, locals: {sub_detail: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/sub_detail-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('sub_detail', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/sub_detail-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/sub_detail-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/sub_detail', formats: :fhirj, locals: {sub_detail: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/sub_detail-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('sub_detail', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/sub_detail-complete.xml')) }
      end
    end
  end
end