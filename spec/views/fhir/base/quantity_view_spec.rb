require 'rails_helper'
require 'fhir/types/quantity'
require 'builder'

describe 'FHIR base-type Quantity', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/quantity-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/quantity', formats: :fhirj, locals: {quantity: object} }

      it { should match_fhir_json(support_file('base/quantity-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('quantity', builder) }

      it { should match_fhir_xml(support_file('base/quantity-simple.xml')) }
    end
  end
end