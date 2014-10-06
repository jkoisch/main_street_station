require 'rails_helper'
require 'fhir/location'

describe 'FHIR Location View', type: :view do
  subject { 'fhir/locations/location' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/location/location.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/location/fhir-location.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/location/fhir-location.xml')}
end
