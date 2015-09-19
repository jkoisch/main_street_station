require 'rails_helper'
require 'fhir/condition'

describe 'FHIR Condition View', type: :view do
  subject { 'fhir/conditions/conditions' }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/conditions/condition-standard.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/conditions/condition-standard.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/conditions/condition-standard.xml')}
end