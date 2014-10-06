require 'rails_helper'
require 'fhir/device'

describe 'FHIR Device View', type: :view do
  subject { 'fhir/devices/device' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/device/device_general.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/device/fhir-device_general.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/device/fhir-device_general.xml')}
end