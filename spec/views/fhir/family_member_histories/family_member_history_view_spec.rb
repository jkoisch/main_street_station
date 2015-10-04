require 'rails_helper'
require 'fhir/family_member_history'

describe 'FHIR FamilyMemberHistory View', type: :view do
  context 'resource' do
    subject { 'fhir/family_member_histories/family_member_history'  }
    let(:resource) { yaml_load('family_member_histories/family_member_history.yaml') }

    it {should produce_fhir_json_like(support_file('family_member_histories/family_member_history.json')) }
    it {should produce_fhir_xml_like(support_file('family_member_histories/family_member_history.xml')) }
  end

  context 'index' do

  end

  context 'show' do

  end
end