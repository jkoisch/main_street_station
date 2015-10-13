require 'rails_helper'
require 'fhir/condition'
require 'builder'

describe 'FHIR View Condition Evidence', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('conditions/stage-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/conditions/stage', formats: :json, locals: {stage: object} }

        it { should match_fhir_json(support_file('conditions/stage-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('stage', builder) }

        it { should match_fhir_xml(support_file('conditions/stage-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('conditions/stage-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/conditions/stage', formats: :json, locals: {stage: object} }

        it { should match_fhir_json(support_file('conditions/stage-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('stage', builder) }

        it { should match_fhir_xml(support_file('conditions/stage-complete.xml')) }
      end
    end
  end
end