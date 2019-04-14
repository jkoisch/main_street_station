require 'rails_helper'
require 'fhir/family_member_history'
require 'builder'

describe 'FHIR FamilyMemberHistory View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/family_member_histories' }

  context 'standard' do
    let(:resource) { yaml_load('family_member_histories/family_member_history-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'family_member_history', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('family_member_histories/family_member_history-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('family_member_histories/family_member_history-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('family_member_histories/family_member_history-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'family_member_history', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('family_member_histories/family_member_history-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('family_member_histories/family_member_history-complete.xml')) }
    end
  end

  context 'show' do
    before(:each) { @family_member_history = yaml_load('family_member_histories/family_member_history-standard.yaml') }

    context 'JSON' do
      subject { render template: 'fhir/family_member_histories/show', formats: :fhirj }

      it { should match_fhir_json(support_file('family_member_histories/show.json')) }
    end

    context 'XML' do
      subject { render template: 'fhir/family_member_histories/show', formats: :fhirx }

      it { should match_fhir_xml(support_file('family_member_histories/show.xml')) }
    end
  end

  context 'index' do
    before(:each) { @family_member_histories = [ yaml_load('family_member_histories/family_member_history-standard.yaml'),
                                       yaml_load('family_member_histories/family_member_history-complete.yaml') ] }

    context 'JSON' do
      subject { render template: 'fhir/family_member_histories/index', formats: :fhirj }

      it { should match_fhir_json(support_file('family_member_histories/index.json'),
                                  {'**/lastUpdated' => 'xxx'}) }
    end

    context 'XML' do
      subject { render template: 'fhir/family_member_histories/index', formats: :fhirx }

      it { should match_fhir_xml(support_file('family_member_histories/index.xml'),
                                 {"//*[local-name()='lastUpdated']/@value" => 'xxx'}) }
    end
  end
end