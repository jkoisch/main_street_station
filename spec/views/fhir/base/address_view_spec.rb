require 'rails_helper'
require 'fhir/types/address'

describe 'FHIR base-type address', type: :view do

  context 'JSON format' do
    context 'should populate lines' do
      let(:object) { yaml_load('base/address-simple.yaml') }
      subject      { render partial: 'fhir/base/address', formats: :json, locals: {address: object} }

      it { should match_fhir_json(support_file('base/address-simple.json')) }
    end
  end

  context 'XML format' do
    context 'should populate simple address' do
      let(:object) { yaml_load('base/address-simple.yaml') }
      subject      { render partial: 'fhir/base/address', formats: :xml, locals: {address: object} }

      it { should match_fhir_xml(support_file('base/address-simple.xml')) }
    end
  end
end