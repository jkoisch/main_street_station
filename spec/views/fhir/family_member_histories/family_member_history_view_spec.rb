require 'rails_helper'
require 'fhir/family_member_history'

describe 'FHIR FamilyMemberHistory View', type: :view do
  subject { 'fhir/family_member_histories/family_member_histories'  }
  let(:resource) { YAML.load(File.read('spec/support-files/fhir/family_member_histories/family_member_history.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir/family_member_histories/family_member_history.json')}
  it {should produce_fhir_xml_like('spec/support-files/fhir/family_member_histories/family_member_history.xml')}
end