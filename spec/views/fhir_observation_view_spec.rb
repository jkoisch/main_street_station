require 'spec_helper'

describe 'FHIR Observation Views' do
  context 'general observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { YAML.load(File.read('spec/support-files/observation_general.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir-observation_general.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir-observation_general.xml')}
  end


  context 'glucose observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { YAML.load(File.read('spec/support-files/observation_glucose.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir-observation_glucose.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir-observation_glucose.xml')}
  end
end