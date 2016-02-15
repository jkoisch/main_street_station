require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Payee', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/payee-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/payee', formats: :json, locals: {payee: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/payee-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('payee', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/payee-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/payee-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/payee', formats: :json, locals: {payee: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/payee-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('payee', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/payee-complete.xml')) }
      end
    end
  end
end