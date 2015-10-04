require 'rails_helper'
require 'fhir/location'

describe 'FHIR Location View', type: :view do
  subject { 'fhir/locations/location' }
  let(:resource) { yaml_load('locations/location-standard.yaml') }

  it {should produce_fhir_json_like(support_file('locations/location-standard.json')) }
  it {should produce_fhir_xml_like(support_file('locations/location-standard.xml')) }
end
