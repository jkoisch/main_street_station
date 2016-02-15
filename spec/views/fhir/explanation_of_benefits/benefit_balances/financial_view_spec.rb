require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit BenefitBalance Financial', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/benefit_balances/financial-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/benefit_balances/financial', formats: :json, locals: {financial: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/benefit_balances/financial-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('financial', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/benefit_balances/financial-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/benefit_balances/financial-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/benefit_balances/financial', formats: :json, locals: {financial: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/benefit_balances/financial-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('financial', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/benefit_balances/financial-complete.xml')) }
      end
    end
  end
end