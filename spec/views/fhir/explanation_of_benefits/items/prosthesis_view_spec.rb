require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Item Prosthesis', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/items/prosthesis-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/items/prosthesis', formats: :json, locals: {prosthesis: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/items/prosthesis-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('prosthesis', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/items/prosthesis-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/items/prosthesis-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/items/prosthesis', formats: :json, locals: {prosthesis: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/items/prosthesis-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('prosthesis', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/items/prosthesis-complete.xml')) }
      end
    end
  end
end