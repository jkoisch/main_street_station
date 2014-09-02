require 'spec_helper'

describe 'FHIR Location View' do
  subject { 'fhir/locations/location' }
  let(:resource) { YAML.load(File.read('spec/support-files/location.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-location.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-location.xml')}
end
