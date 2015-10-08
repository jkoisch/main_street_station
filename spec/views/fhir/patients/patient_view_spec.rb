require 'rails_helper'
require 'fhir/patient'
require 'builder'

describe 'FHIR Patient View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/patients' }

  context 'standard' do
    let(:resource) { yaml_load('patients/patient-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'patient', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('patients/patient-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('patients/patient-standard.xml')) }
    end
  end
end