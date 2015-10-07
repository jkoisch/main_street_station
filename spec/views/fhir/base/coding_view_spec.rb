require 'rails_helper'
require 'fhir/types/coding'
require 'builder'

describe 'FHIR base-type Coding', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/coding-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/coding', formats: :json, locals: {coding: object} }

      it { should match_fhir_json(support_file('base/coding-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('thing', builder) }

      it { should match_fhir_xml(support_file('base/coding-simple.xml')) }
    end
  end
end