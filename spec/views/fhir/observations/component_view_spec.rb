require 'rails_helper'
require 'fhir/observation'
require 'builder'

describe 'FHIR View Observation Component', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('observations/component-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/observations/component', formats: :fhirj, locals: {component: object} }

        it { should match_fhir_json(support_file('observations/component-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('component', builder) }

        it { should match_fhir_xml(support_file('observations/component-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('observations/component-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/observations/component', formats: :fhirj, locals: {component: object} }

        it { should match_fhir_json(support_file('observations/component-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('component', builder) }

        it { should match_fhir_xml(support_file('observations/component-complete.xml')) }
      end
    end
  end
end