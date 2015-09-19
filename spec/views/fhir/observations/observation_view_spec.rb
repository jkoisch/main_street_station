require 'rails_helper'
require 'fhir/observation'

describe 'FHIR Observation Views', type: :view do
  context 'general observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/observations/observation-general.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/observations/observation-general.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/observations/observation-general.xml')}
  end

  context 'glucose observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/observations/observation-glucose.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/observations/observation-glucose.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/observations/observation-glucose.xml')}
  end
end
