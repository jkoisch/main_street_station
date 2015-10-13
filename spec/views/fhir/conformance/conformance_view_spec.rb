require 'rails_helper'
require 'fhir/conformance'
require 'builder'

describe 'FHIR Conformance View', type: :view do
  subject { 'fhir/conformance/conformance' }
  before(:each) { controller.prepend_view_path 'app/views/fhir/conformance' }

  context 'standard' do
    let(:resource) { yaml_load('conformance/conformance.yaml') }

    context 'JSON' do
      subject { render(partial: 'conformance', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('conformance/conformance.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('conformance/conformance.xml')) }
    end
  end
end
