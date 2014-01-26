require 'spec_helper'
require 'fhir/questionnaire'

describe 'fhir/questionnaires/questionnaire' do
  let(:resource) { YAML.load(File.read('spec/support-files/questionnaire_general.yaml'))}

  it {should produce_fhir_json_like('spec/support-files/fhir-questionnaire_general.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-questionnaire_general.xml')}
end

describe 'fhir/questionnaires/questionnaire' do
  let(:resource) { YAML.load(File.read('spec/support-files/questionnaire_lifelines.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-questionnaire_lifelines.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-questionnaire_lifelines.xml')}
end


describe 'fhir/questionnaires/questionnaire' do
  let(:resource) { YAML.load(File.read('spec/support-files/questionnaire_bluebook.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-questionnaire_bluebook.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir-questionnaire_bluebook.xml')}
end