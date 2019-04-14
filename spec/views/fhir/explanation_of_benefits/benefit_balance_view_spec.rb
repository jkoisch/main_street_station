require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit BenefitBalance', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/benefit_balance-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/benefit_balance', formats: :fhirj, locals: {benefit_balance: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/benefit_balance-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('benefit_balance', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/benefit_balance-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/benefit_balance-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/benefit_balance', formats: :fhirj, locals: {benefit_balance: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/benefit_balance-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('benefit_balance', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/benefit_balance-complete.xml')) }
      end
    end
  end
end