require 'rails_helper'
require 'fhir/patient'

describe 'FHIR Patient View', type: :view do
  subject { 'fhir/patients/patient' }
  let(:resource) { yaml_load('patients/patient-standard.yaml') }

  it {should produce_fhir_json_like(support_file('patients/patient-standard.json')) }
  it {should produce_fhir_xml_like(support_file('patients/patient-standard.xml')) }
end