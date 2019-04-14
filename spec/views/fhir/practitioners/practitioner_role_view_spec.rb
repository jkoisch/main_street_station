require 'rails_helper'
require 'fhir/practitioner'
require 'builder'

describe 'FHIR View Practitioner PractitionerRole', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('practitioners/practitioner_role-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/practitioners/practitioner_role', formats: :fhirj, locals: {practitioner_role: object} }

        it { should match_fhir_json(support_file('practitioners/practitioner_role-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('practitioner_role', builder) }

        it { should match_fhir_xml(support_file('practitioners/practitioner_role-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('practitioners/practitioner_role-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/practitioners/practitioner_role', formats: :fhirj, locals: {practitioner_role: object} }

        it { should match_fhir_json(support_file('practitioners/practitioner_role-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('practitioner_role', builder) }

        it { should match_fhir_xml(support_file('practitioners/practitioner_role-complete.xml')) }
      end
    end

  end
end
