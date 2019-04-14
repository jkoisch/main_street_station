require 'rails_helper'
require 'fhir/observation'
require 'builder'

describe 'FHIR Observation Views', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/observations' }

  context 'standard' do
    let(:resource) { yaml_load('observations/observation-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'observation', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('observations/observation-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('observations/observation-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('observations/observation-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'observation', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('observations/observation-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('observations/observation-complete.xml')) }
    end
  end

  context 'show' do
    before(:each) { @observation = yaml_load('observations/observation-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/observations/show', formats: :fhirj }

      it { should match_fhir_json(support_file('observations/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/observations/show', formats: :fhirx }

      it { should match_fhir_xml(support_file('observations/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @observations = [ yaml_load('observations/observation-standard.yaml'),
                                       yaml_load('observations/observation-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/observations/index', formats: :fhirj }

      it { should match_fhir_json(support_file('observations/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/observations/index', formats: :fhirx }

      it { should match_fhir_xml(support_file('observations/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end
