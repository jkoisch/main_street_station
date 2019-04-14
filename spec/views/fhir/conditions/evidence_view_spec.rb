require 'rails_helper'
require 'fhir/condition'
require 'builder'

describe 'FHIR View Condition Evidence', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('conditions/evidence-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/conditions/evidence', formats: :fhirj, locals: {evidence: object} }

        it { should match_fhir_json(support_file('conditions/evidence-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('evidence', builder) }

        it { should match_fhir_xml(support_file('conditions/evidence-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('conditions/evidence-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/conditions/evidence', formats: :fhirj, locals: {evidence: object} }

        it { should match_fhir_json(support_file('conditions/evidence-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('evidence', builder) }

        it { should match_fhir_xml(support_file('conditions/evidence-complete.xml')) }
      end
    end
  end
end