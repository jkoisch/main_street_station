require 'rails_helper'
require 'fhir/location'
require 'builder'

describe 'FHIR Location View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/locations' }

  context 'standard' do
    let(:resource) { yaml_load('locations/location-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'location', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('locations/location-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('locations/location-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('locations/location-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'location', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('locations/location-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('locations/location-complete.xml')) }
    end
  end

  context 'show' do
    before(:each) { @location = yaml_load('locations/location-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/locations/show', formats: :fhirj }

      it { should match_fhir_json(support_file('locations/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/locations/show', formats: :fhirx }

      it { should match_fhir_xml(support_file('locations/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @locations = [ yaml_load('locations/location-standard.yaml'),
                                       yaml_load('locations/location-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/locations/index', formats: :fhirj }

      it { should match_fhir_json(support_file('locations/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/locations/index', formats: :fhirx }

      it { should match_fhir_xml(support_file('locations/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end
