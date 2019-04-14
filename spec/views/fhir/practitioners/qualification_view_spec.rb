require 'rails_helper'
require 'fhir/practitioner'
require 'builder'

describe 'FHIR View Practitioner Qualification', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('practitioners/qualification-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/practitioners/qualification', formats: :fhirj, locals: {qualification: object} }

        it { should match_fhir_json(support_file('practitioners/qualification-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('qualification', builder) }

        it { should match_fhir_xml(support_file('practitioners/qualification-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('practitioners/qualification-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/practitioners/qualification', formats: :fhirj, locals: {qualification: object} }

        it { should match_fhir_json(support_file('practitioners/qualification-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('qualification', builder) }

        it { should match_fhir_xml(support_file('practitioners/qualification-complete.xml')) }
      end
    end

  end
end
