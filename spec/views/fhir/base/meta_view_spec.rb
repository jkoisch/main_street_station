require 'rails_helper'
require 'fhir/types/meta'
require 'builder'

describe 'FHIR base-type Meta', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/meta-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/meta', formats: :json, locals: {meta: object} }

      it { should match_fhir_json(support_file('base/meta-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('meta', builder) }

      it { should match_fhir_xml(support_file('base/meta-simple.xml')) }
    end
  end
end