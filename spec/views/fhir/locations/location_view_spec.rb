require 'rails_helper'
require 'fhir/location'

describe 'FHIR Location View', type: :view do
  subject { 'fhir/locations/location' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/locations/location-standard.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/locations/location-standard.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/locations/location-standard.xml')}
end
