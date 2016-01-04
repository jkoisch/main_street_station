require 'rails_helper'
require 'fhir/patient'
require 'builder'

describe 'FHIR View Patient Contact', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('patients/contact-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/patients/contact', formats: :json, locals: {contact: object} }

        it { should match_fhir_json(support_file('patients/contact-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('contact', builder) }

        it { should match_fhir_xml(support_file('patients/contact-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('patients/contact-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/patients/contact', formats: :json, locals: {contact: object} }

        it { should match_fhir_json(support_file('patients/contact-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('contact', builder) }

        it { should match_fhir_xml(support_file('patients/contact-complete.xml')) }
      end
    end
  end
end