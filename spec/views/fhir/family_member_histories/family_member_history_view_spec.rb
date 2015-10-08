require 'rails_helper'
require 'fhir/family_member_history'
require 'builder'

describe 'FHIR FamilyMemberHistory View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/family_member_histories' }

  context 'standard' do
    let(:resource) { yaml_load('family_member_histories/family_member_history-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'family_member_history', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('family_member_histories/family_member_history-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('family_member_histories/family_member_history-standard.xml')) }
    end
  end

  context 'index' do

  end

  context 'show' do

  end
end