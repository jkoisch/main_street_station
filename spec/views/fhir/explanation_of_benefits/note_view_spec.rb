require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR View ExplanationOfBenefit Note', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('explanation_of_benefits/note-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/note', formats: :json, locals: {note: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/note-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('note', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/note-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('explanation_of_benefits/note-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/explanation_of_benefits/note', formats: :json, locals: {note: object} }

        it { should match_fhir_json(support_file('explanation_of_benefits/note-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('note', builder) }

        it { should match_fhir_xml(support_file('explanation_of_benefits/note-complete.xml')) }
      end
    end
  end
end