require 'spec_helper'

describe 'FHIR Device View', :focus do
  subject { 'fhir/devices/device' }
  let(:resource) { YAML.load(File.read('spec/support-files/device_general.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-device_general.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-device_general.xml')}
end