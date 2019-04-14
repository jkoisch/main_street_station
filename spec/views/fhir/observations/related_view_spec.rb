require 'rails_helper'
require 'fhir/observation'
require 'builder'

describe 'FHIR View Observation Related', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('observations/related-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/observations/related', formats: :fhirj, locals: {related: object} }

        it { should match_fhir_json(support_file('observations/related-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('related', builder) }

        it { should match_fhir_xml(support_file('observations/related-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('observations/related-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/observations/related', formats: :fhirj, locals: {related: object} }

        it { should match_fhir_json(support_file('observations/related-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('related', builder) }

        it { should match_fhir_xml(support_file('observations/related-complete.xml')) }
      end
    end
  end
end