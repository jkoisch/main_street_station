require 'rails_helper'
require 'fhir/practitioner'
require 'builder'

describe 'FHIR Practitioner View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/practitioners' }

  context 'standard' do
    let(:resource) { yaml_load('practitioners/practitioner-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'practitioner', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('practitioners/practitioner-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('practitioners/practitioner-standard.xml'))  }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('practitioners/practitioner-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'practitioner', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('practitioners/practitioner-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('practitioners/practitioner-complete.xml'))  }
    end
  end

  context 'show' do
    before(:each) { @practitioner = yaml_load('practitioners/practitioner-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/practitioners/show', formats: :fhirj }

      it { should match_fhir_json(support_file('practitioners/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/practitioners/show', formats: :fhirx }

      it { should match_fhir_xml(support_file('practitioners/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @practitioners = [ yaml_load('practitioners/practitioner-standard.yaml'),
                                  yaml_load('practitioners/practitioner-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/practitioners/index', formats: :fhirj }

      it { should match_fhir_json(support_file('practitioners/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/practitioners/index', formats: :fhirx }

      it { should match_fhir_xml(support_file('practitioners/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end
