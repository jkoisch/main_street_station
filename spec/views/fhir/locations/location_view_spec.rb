require 'rails_helper'
require 'fhir/location'
require 'builder'

describe 'FHIR Location View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/locations' }

  context 'standard' do
    let(:resource) { yaml_load('locations/location-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'location', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('locations/location-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('locations/location-standard.xml')) }
    end
  end
end
