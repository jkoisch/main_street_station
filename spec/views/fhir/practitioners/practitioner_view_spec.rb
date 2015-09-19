require 'rails_helper'
require 'fhir/practitioner'

describe 'FHIR Practitioner View', type: :view do
  subject { 'fhir/practitioners/practitioner' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/practitioners/practitioner-standard.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/practitioners/practitioner-standard.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/practitioners/practitioner-standard.xml')}
end
