require 'spec_helper'
require 'fhir/condition'

describe 'fhir/conditions/condition' do
  let(:resource) { YAML.load(File.read('spec/support-files/condition_general.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-condition_general.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-condition_general.xml')}
end