require 'rails_helper'
require 'fhir/types/address'

describe 'FHIR base-type address', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/address-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/address', formats: :json, locals: {address: object} }

      it { should match_fhir_json(support_file('base/address-simple.json')) }
    end

    context 'XML' do
      subject { render inline: "xml.address {|xml| xml << render('fhir/base/address', {address: thing})}",
                       type: :builder, locals: {thing: object} }

      it { should match_fhir_xml(support_file('base/address-simple.xml')) }
    end
  end
end