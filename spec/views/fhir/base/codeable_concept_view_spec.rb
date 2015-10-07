require 'rails_helper'
require 'fhir/types/codeable_concept'
require 'builder'

describe 'FHIR base-type CodeableConcept', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/codeable_concept-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/codeable_concept', formats: :json, locals: {codeable_concept: object} }

      it { should match_fhir_json(support_file('base/codeable_concept-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('type', builder) }

      it { should match_fhir_xml(support_file('base/codeable_concept-simple.xml')) }
    end
  end
end