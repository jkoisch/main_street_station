require 'rails_helper'
require 'fhir/types/ratio'
require 'fhir/types/quantity'
require 'builder'

describe 'FHIR base-type Ratio', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/ratio-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/ratio', formats: :json, locals: {ratio: object} }

      it { should match_fhir_json(support_file('base/ratio-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('ratio', builder) }

      it { should match_fhir_xml(support_file('base/ratio-simple.xml')) }
    end
  end
end