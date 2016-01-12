require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Item', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/item-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/item', formats: :json, locals: {item: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/item-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('item', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/item-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/item-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/item', formats: :json, locals: {item: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/item-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('item', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/item-complete.xml')) }
      end
    end
  end
end