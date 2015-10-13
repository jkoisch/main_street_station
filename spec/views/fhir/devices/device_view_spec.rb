require 'rails_helper'
require 'fhir/device'
require 'builder'

describe 'FHIR Device View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/devices' }

  context 'standard' do
    let(:resource) { yaml_load('devices/device-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'device', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('devices/device-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('devices/device-standard.xml')) }
    end
  end
end