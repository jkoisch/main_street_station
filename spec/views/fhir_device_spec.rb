require 'spec_helper'
require 'fhir/device'

describe 'fhir/devices/device' do
  let(:resource) { YAML.load(File.read('spec/support-files/device_general.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-device_general.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-device_general.xml')}
end