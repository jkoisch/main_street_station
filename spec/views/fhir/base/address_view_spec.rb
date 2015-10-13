require 'rails_helper'
require 'fhir/types/address'
require 'builder'

describe 'FHIR base-type Address', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/address-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/address', formats: :json, locals: {address: object} }

      it { should match_fhir_json(support_file('base/address-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('address', builder) }

      it { should match_fhir_xml(support_file('base/address-simple.xml')) }
    end
  end
end