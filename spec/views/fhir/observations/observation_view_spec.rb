require 'rails_helper'
require 'fhir/observation'

describe 'FHIR Observation Views', type: :view do
  context 'general observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { yaml_load('observations/observation-general.yaml') }

    it {should produce_fhir_json_like(support_file('observations/observation-general.json')) }
    it {should produce_fhir_xml_like(support_file('observations/observation-general.xml')) }
  end

  context 'glucose observation' do
    subject { '/fhir/observations/observation' }
    let(:resource) { yaml_load('observations/observation-glucose.yaml') }

    it {should produce_fhir_json_like(support_file('observations/observation-glucose.json')) }
    it {should produce_fhir_xml_like(support_file('observations/observation-glucose.xml')) }
  end
end
