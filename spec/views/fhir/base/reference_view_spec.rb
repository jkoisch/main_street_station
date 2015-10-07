require 'rails_helper'
require 'fhir/types/reference'
require 'builder'

describe 'FHIR base-type Reference', type: :view do
  context 'local' do
    let(:object) { yaml_load('base/reference-local.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/reference', formats: :json, locals: {reference: object} }

      it { should match_fhir_json(support_file('base/reference-local.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('other', builder) }

      it { should match_fhir_xml(support_file('base/reference-local.xml')) }
    end
  end

  context 'external' do
    let(:object) { yaml_load('base/reference-external.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/reference', formats: :json, locals: {reference: object} }

      it { should match_fhir_json(support_file('base/reference-external.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('other', builder) }

      it { should match_fhir_xml(support_file('base/reference-external.xml')) }
    end
  end

  context 'complete' do
    let(:object) { yaml_load('base/reference-complete.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/reference', formats: :json, locals: {reference: object} }

      it { should match_fhir_json(support_file('base/reference-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('careProvider', builder) }

      it { should match_fhir_xml(support_file('base/reference-complete.xml')) }
    end
  end
end