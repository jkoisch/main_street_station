require 'rails_helper'
require 'fhir/types/contact_point'
require 'builder'

describe 'FHIR base-type ContactPoint', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/contact_point-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/contact_point', formats: :fhirj, locals: {contact_point: object} }

      it { should match_fhir_json(support_file('base/contact_point-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('telecom', builder) }

      it { should match_fhir_xml(support_file('base/contact_point-simple.xml')) }
    end
  end
end