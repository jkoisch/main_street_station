require 'rails_helper'
require 'fhir/questionnaire'
require 'builder'

describe 'FHIR Questionnaire View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/questionnaires' }

  context 'general' do
    let(:resource) { yaml_load('questionnaires/questionnaire-general.yaml') }

    context 'JSON' do
      subject { render(partial: 'questionnaire', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('questionnaires/questionnaire-general.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('questionnaires/questionnaire-general.xml')) }
    end
  end

  context 'lifeline' do
    let(:resource) { yaml_load('questionnaires/questionnaire-lifelines.yaml') }

    context 'JSON' do
      subject { render(partial: 'questionnaire', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('questionnaires/questionnaire-lifelines.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('questionnaires/questionnaire-lifelines.xml')) }
    end
  end


  context 'bluebook' do
    let(:resource) { yaml_load('questionnaires/questionnaire-bluebook.yaml') }

    context 'JSON' do
      subject { render(partial: 'questionnaire', formats: :fhirj, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('questionnaires/questionnaire-bluebook.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('questionnaires/questionnaire-bluebook.xml')) }
    end
  end
end
