require 'spec_helper'
require 'fhir/condition'

describe 'FHIR Condition View' do
  subject { 'fhir/conditions/condition' }
  let(:resource) { YAML.load(File.read('spec/support-files/condition.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-condition.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-condition.xml')}
end