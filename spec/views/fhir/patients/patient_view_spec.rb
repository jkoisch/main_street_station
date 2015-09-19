require 'rails_helper'
require 'fhir/patient'

describe 'FHIR Patient View', type: :view do
  subject { 'fhir/patients/patient' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/patients/patient-standard.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/patients/patient-standard.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/patients/patient-standard.xml')}
end