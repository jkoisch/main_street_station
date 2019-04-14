require 'rails_helper'
require 'fhir/observation'
require 'builder'

describe 'FHIR View Observation ReferenceRange', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('observations/reference_range-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/observations/reference_range', formats: :fhirj, locals: {reference_range: object} }

        it { should match_fhir_json(support_file('observations/reference_range-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('reference_range', builder) }

        it { should match_fhir_xml(support_file('observations/reference_range-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('observations/reference_range-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/observations/reference_range', formats: :fhirj, locals: {reference_range: object} }

        it { should match_fhir_json(support_file('observations/reference_range-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('reference_range', builder) }

        it { should match_fhir_xml(support_file('observations/reference_range-complete.xml')) }
      end
    end
  end
end