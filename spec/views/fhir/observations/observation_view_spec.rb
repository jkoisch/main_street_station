require 'rails_helper'
require 'fhir/observation'
require 'builder'

describe 'FHIR Observation Views', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/observations' }

  context 'general' do
    let(:resource) { yaml_load('observations/observation-general.yaml') }

    context 'JSON' do
      subject { render(partial: 'observation', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('observations/observation-general.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('observations/observation-general.xml')) }
    end
  end

  context 'glucose' do
    let(:resource) { yaml_load('observations/observation-glucose.yaml') }

    context 'JSON' do
      subject { render(partial: 'observation', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('observations/observation-glucose.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('observations/observation-glucose.xml')) }
    end
  end
end
