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

  context 'complete' do
    let(:resource) { yaml_load('devices/device-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'device', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('devices/device-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('devices/device-complete.xml')) }
    end
  end

  context 'show' do
    before(:each) { @device = yaml_load('devices/device-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/devices/show', formats: :json }

      it { should match_fhir_json(support_file('devices/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/devices/show', formats: :xml }

      it { should match_fhir_xml(support_file('devices/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @devices = [ yaml_load('devices/device-standard.yaml'),
                                   yaml_load('devices/device-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/devices/index', formats: :json }

      it { should match_fhir_json(support_file('devices/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/devices/index', formats: :xml }

      it { should match_fhir_xml(support_file('devices/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end