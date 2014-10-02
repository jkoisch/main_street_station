require 'spec_helper'

describe 'FHIR Conformance View' do
  subject { 'fhir/conformance/conformance' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/conformance/conformance.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/conformance/fhir-conformance.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/conformance/fhir-conformance.xml')}
end
