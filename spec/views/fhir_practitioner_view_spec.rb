require 'rails_helper'
require 'fhir/practitioner'

describe 'FHIR Practitioner View', type: :view do
  subject { 'fhir/practitioners/practitioner' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/practitioner/practitioner.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/practitioner/fhir-practitioner.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/practitioner/fhir-practitioner.xml')}
end
