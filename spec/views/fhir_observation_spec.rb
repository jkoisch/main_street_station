require 'spec_helper'
require 'fhir/observation'

describe 'fhir/observations/observation' do
  let(:resource) { YAML.load(File.read('spec/support-files/observation.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-observation.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-observation.xml')}
end