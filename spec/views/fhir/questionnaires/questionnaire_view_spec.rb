require 'rails_helper'
require 'fhir/questionnaire'

describe 'FHIR Questionnaire View', type: :view do
  context 'general questionnaires' do
    subject { 'fhir/questionnaires/questionnaire' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/questionnaires/questionnaire-general.yaml'))}

    it {should produce_fhir_json_like('spec/support-files/fhir/questionnaires/questionnaire-general.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/questionnaires/questionnaire-general.xml')}
  end

  context 'lifeline questionnaires' do
    subject { 'fhir/questionnaires/questionnaire' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/questionnaires/questionnaire-lifelines.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/questionnaires/questionnaire-lifelines.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/questionnaires/questionnaire-lifelines.xml')}
  end


  context 'bluebook questionnaires' do
    subject { 'fhir/questionnaires/questionnaire' }
    let(:resource) { YAML.load(File.read('spec/support-files/fhir/questionnaires/questionnaire-bluebook.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir/questionnaires/questionnaire-bluebook.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir/questionnaires/questionnaire-bluebook.xml')}
  end
end
