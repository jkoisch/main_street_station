require 'rails_helper'
require 'fhir/types/identifier'
require 'builder'

describe 'FHIR base-type Identifier', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/identifier-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/identifier', formats: :fhirj, locals: {identifier: object} }

      it { should match_fhir_json(support_file('base/identifier-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('identifier', builder) }

      it { should match_fhir_xml(support_file('base/identifier-simple.xml')) }
    end
  end
end