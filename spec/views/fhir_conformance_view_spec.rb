require 'rails_helper'
require 'fhir/conformance'

describe 'FHIR Conformance View', type: :view do
  subject { 'fhir/conformance/conformance' }
  let(:resource) { yaml_load('conformance/conformance.yaml') }

  it {should produce_fhir_json_like(support_file('conformance/conformance.json'))}
  it {should produce_fhir_xml_like(support_file('conformance/conformance.xml'))}
end
