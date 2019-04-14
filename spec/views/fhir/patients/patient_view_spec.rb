require 'rails_helper'
require 'fhir/patient'
require 'builder'

describe 'FHIR Patient View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/patients' }

  context 'standard' do
    let(:resource) { yaml_load('patients/patient-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'patient', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('patients/patient-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('patients/patient-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('patients/patient-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'patient', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('patients/patient-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('patients/patient-complete.xml')) }
    end
  end

  context 'show' do
    before(:each) { @patient = yaml_load('patients/patient-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/patients/show', formats: :fhirj }

      it { should match_fhir_json(support_file('patients/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/patients/show', formats: :fhirx }

      it { should match_fhir_xml(support_file('patients/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @patients = [ yaml_load('patients/patient-standard.yaml'),
                                       yaml_load('patients/patient-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/patients/index', formats: :fhirj }

      it { should match_fhir_json(support_file('patients/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/patients/index', formats: :fhirx }

      it { should match_fhir_xml(support_file('patients/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end