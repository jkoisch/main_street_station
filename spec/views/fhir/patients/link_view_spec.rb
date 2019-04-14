require 'rails_helper'
require 'fhir/patient'
require 'builder'

describe 'FHIR View Patient Link', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('patients/link-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/patients/link', formats: :fhirj, locals: {link: object} }

        it { should match_fhir_json(support_file('patients/link-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('link', builder) }

        it { should match_fhir_xml(support_file('patients/link-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('patients/link-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/patients/link', formats: :fhirj, locals: {link: object} }

        it { should match_fhir_json(support_file('patients/link-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('link', builder) }

        it { should match_fhir_xml(support_file('patients/link-complete.xml')) }
      end
    end
  end
end