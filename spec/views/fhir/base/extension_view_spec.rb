require 'rails_helper'
require 'fhir/types/extension'
require 'builder'

describe 'FHIR base-type Extension', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/extension-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/extension', formats: :fhirj, locals: {extension: object} }

      it { should match_fhir_json(support_file('base/extension-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('extension', builder) }

      it { should match_fhir_xml(support_file('base/extension-simple.xml')) }
    end
  end
end