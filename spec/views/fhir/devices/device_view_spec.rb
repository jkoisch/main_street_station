require 'rails_helper'
require 'fhir/device'

describe 'FHIR Device View', type: :view do
  subject { 'fhir/devices/device' }
  let(:resource) { yaml_load('devices/device-general.yaml') }

  it {should produce_fhir_json_like(support_file('devices/device-general.json')) }
  it {should produce_fhir_xml_like(support_file('devices/device-general.xml')) }
end