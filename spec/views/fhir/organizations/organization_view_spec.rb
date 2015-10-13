require 'rails_helper'
require 'fhir/organization'
require 'builder'

describe 'FHIR Organization View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/organizations' }

  context 'standard' do
    let(:resource) { yaml_load('organizations/organization-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'organization', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('organizations/organization-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('organizations/organization-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('organizations/organization-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'organization', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('organizations/organization-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('organizations/organization-complete.xml')) }
    end
  end

  context 'show' do
    before(:each) { @organization = yaml_load('organizations/organization-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/organizations/show', formats: :json }

      it { should match_fhir_json(support_file('organizations/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/organizations/show', formats: :xml }

      it { should match_fhir_xml(support_file('organizations/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @organizations = [ yaml_load('organizations/organization-standard.yaml'),
                                       yaml_load('organizations/organization-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/organizations/index', formats: :json }

      it { should match_fhir_json(support_file('organizations/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/organizations/index', formats: :xml }

      it { should match_fhir_xml(support_file('organizations/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end
