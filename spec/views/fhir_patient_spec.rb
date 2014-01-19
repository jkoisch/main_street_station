require 'spec_helper'
require 'fhir/patient'

describe 'fhir/patients/patient' do
  let(:resource) { YAML.load(File.read('spec/support-files/patient.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-patient.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-patient.xml')}
end