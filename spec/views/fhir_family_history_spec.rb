require 'spec_helper'
require 'fhir/family_history'

describe 'fhir/family_histories/family_history' do
  let(:resource) { YAML.load(File.read('spec/support-files/family_history.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-family_history.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-family_history.xml')}
end