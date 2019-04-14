require 'rails_helper'
require 'fhir/types/range'
require 'fhir/types/quantity'
require 'builder'

describe 'FHIR base-type Range', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/range-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/range', formats: :fhirj, locals: {range: object} }

      it { should match_fhir_json(support_file('base/range-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('range', builder) }

      it { should match_fhir_xml(support_file('base/range-simple.xml')) }
    end
  end
end