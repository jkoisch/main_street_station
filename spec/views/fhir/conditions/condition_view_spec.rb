require 'rails_helper'
require 'fhir/condition'
require 'builder'

describe 'FHIR Condition View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/conditions' }

  context 'standard' do
    let(:resource) { yaml_load('conditions/condition-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'condition', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('conditions/condition-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('conditions/condition-standard.xml')) }
    end
  end

  context 'complete' do
    let(:resource) { yaml_load('conditions/condition-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'condition', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('conditions/condition-complete.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('conditions/condition-complete.xml')) }
    end
  end
end