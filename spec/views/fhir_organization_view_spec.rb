require 'spec_helper'

describe 'FHIR Organization View' do
  subject { 'fhir/organizations/organization' }
  let(:resource) { YAML.load(File.read('spec/support-files/organization.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-organization.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-organization.xml')}
end
