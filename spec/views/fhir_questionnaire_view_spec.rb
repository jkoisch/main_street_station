require 'spec_helper'

describe 'FHIR Questionnaire View' do
  context 'general questionnaires' do
    subject { 'fhir/questionnaires/questionnaire' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/questionnaire/questionnaire_general.yaml'))}

    it {should produce_fhir_json_like('spec/support-files/fhir/questionnaire/fhir-questionnaire_general.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/questionnaire/fhir-questionnaire_general.xml')}
  end

  context 'lifeline questionnaires' do
    subject { 'fhir/questionnaires/questionnaire' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/questionnaire/questionnaire_lifelines.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/questionnaire/fhir-questionnaire_lifelines.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/questionnaire/fhir-questionnaire_lifelines.xml')}
  end


  context 'bluebook questionnaires' do
    subject { 'fhir/questionnaires/questionnaire' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/questionnaire/questionnaire_bluebook.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/questionnaire/fhir-questionnaire_bluebook.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/questionnaire/fhir-questionnaire_bluebook.xml')}
  end
end
