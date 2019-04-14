require 'rails_helper'
require 'fhir/family_member_history'
require 'builder'

describe 'FHIR View FamilyMemberHistory Condition', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('family_member_histories/condition-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/family_member_histories/condition', formats: :fhirj, locals: {condition: object} }

        it { should match_fhir_json(support_file('family_member_histories/condition-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('condition', builder) }

        it { should match_fhir_xml(support_file('family_member_histories/condition-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('family_member_histories/condition-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/family_member_histories/condition', formats: :fhirj, locals: {condition: object} }

        it { should match_fhir_json(support_file('family_member_histories/condition-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('condition', builder) }

        it { should match_fhir_xml(support_file('family_member_histories/condition-complete.xml')) }
      end
    end
  end
end