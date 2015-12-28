require 'rails_helper'
require 'fhir/coverage'
require 'builder'

describe 'FHIR Coverage View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/coverages' }

  context 'standard' do
    let(:resource) { yaml_load('coverages/coverage-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'coverage', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('coverages/coverage-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('coverages/coverage-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('coverages/coverage-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'coverage', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('coverages/coverage-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('coverages/coverage-complete.xml')) }
    end
  end
end