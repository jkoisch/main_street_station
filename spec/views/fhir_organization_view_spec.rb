require 'rails_helper'
require 'fhir/organization'

describe 'FHIR Organization View', type: :view do
  subject { 'fhir/organizations/organization' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/organization/organization.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/organization/fhir-organization.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/organization/fhir-organization.xml')}
end
