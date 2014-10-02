require 'spec_helper'

describe 'FHIR FamilyHistory View' do
  subject { 'fhir/family_histories/family_history' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/family_history/family_history.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/family_history/fhir-family_history.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/family_history/fhir-family_history.xml')}
end