require 'rails_helper'
require 'fhir/practitioner'

describe 'FHIR Practitioner View', type: :view do
  subject { 'fhir/practitioners/practitioner' }
  let(:resource) { yaml_load('practitioners/practitioner-standard.yaml') }

  it {should produce_fhir_json_like(support_file('practitioners/practitioner-standard.json')) }
  it {should produce_fhir_xml_like(support_file('practitioners/practitioner-standard.xml')) }
end
