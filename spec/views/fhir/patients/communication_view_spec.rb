require 'rails_helper'
require 'fhir/patient'
require 'builder'

describe 'FHIR View Patient Communication', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('patients/communication-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/patients/communication', formats: :fhirj, locals: {communication: object} }

        it { should match_fhir_json(support_file('patients/communication-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('communication', builder) }

        it { should match_fhir_xml(support_file('patients/communication-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('patients/communication-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/patients/communication', formats: :fhirj, locals: {communication: object} }

        it { should match_fhir_json(support_file('patients/communication-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('communication', builder) }

        it { should match_fhir_xml(support_file('patients/communication-complete.xml')) }
      end
    end
  end
end
