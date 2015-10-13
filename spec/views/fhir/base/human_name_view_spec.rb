require 'rails_helper'
require 'fhir/types/human_name'
require 'builder'

describe 'FHIR base-type HumanName', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/human_name-simple.yaml') }

    context 'JSON' do
      subject { render partial: 'fhir/base/human_name', formats: :json, locals: {human_name: object} }

      it { should match_fhir_json(support_file('base/human_name-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('name', builder) }
      it { should match_fhir_xml(support_file('base/human_name-simple.xml')) }
    end
  end

  context 'complete' do
    let(:object) { yaml_load('base/human_name-complete.yaml') }

    context 'JSON' do
      subject { render partial: 'fhir/base/human_name', formats: :json, locals: {human_name: object} }

      it { should match_fhir_json(support_file('base/human_name-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('name', builder) }
      it { should match_fhir_xml(support_file('base/human_name-complete.xml')) }
    end
  end
end