require 'rails_helper'
require 'fhir/condition'

describe 'FHIR Condition View', type: :view do
  subject { 'fhir/conditions/condition' }
  let(:resource) { yaml_load('conditions/condition-standard.yaml') }

  it {should produce_fhir_json_like(support_file('conditions/condition-standard.json'))}
  it {should produce_fhir_xml_like(support_file('conditions/condition-standard.xml')) }
end