require 'rails_helper'
require 'fhir/explanation_of_benefit'
require 'builder'

describe 'FHIR ExplanationOfBenefit View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/explanation_of_benefits' }

  # context 'standard' do
  #   let(:resource) { yaml_load('explanation_of_benefits/explanation_of_benefit-standard.yaml') }
  #
  #   context 'JSON' do
  #     subject { render(partial: 'explanation_of_benefit', formats: :json, locals: {resource: resource}) }
  #
  #     it {should match_fhir_json(support_file('explanation_of_benefits/explanation_of_benefit-standard.json')) }
  #   end

    # context 'XML' do
    #   let(:builder) { Builder::XmlMarkup.new() }
    #   subject { resource.to_xml(nil, builder, true) }
    #
    #   it {should match_fhir_xml(support_file('family_member_histories/family_member_history-standard.xml')) }
    # end
  # end

  context 'complete' do
    let(:resource) { yaml_load('explanation_of_benefits/explanation_of_benefit-complete.yaml') }

    context 'JSON' do
      subject { render(partial: 'explanation_of_benefit', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('explanation_of_benefits/explanation_of_benefit-complete.json')) }
    end

    # context 'XML' do
    #   let(:builder) { Builder::XmlMarkup.new() }
    #   subject { resource.to_xml(nil, builder, true) }
    #
    #   it {should match_fhir_xml(support_file('family_member_histories/family_member_history-complete.xml')) }
    # end
  end

end
