require 'rails_helper'
require 'fhir/observation'

describe 'FHIR Observation Views', type: :view do
  context 'general observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/observation/observation_general.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/observation/fhir-observation_general.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/observation/fhir-observation_general.xml')}
  end

  context 'glucose observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/observation/observation_glucose.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/observation/fhir-observation_glucose.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/observation/fhir-observation_glucose.xml')}
  end
end
