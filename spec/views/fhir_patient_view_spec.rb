require 'spec_helper'

describe 'FHIR Patient View' do
  subject { 'fhir/patients/patient' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/patient/patient.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/patient/fhir-patient.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/patient/fhir-patient.xml')}
end