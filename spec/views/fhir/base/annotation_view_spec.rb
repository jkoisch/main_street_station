require 'rails_helper'
require 'fhir/types/annotation'
require 'builder'

describe 'FHIR base-type Annotation', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/annotation-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/annotation', formats: :fhirj, locals: {annotation: object} }

      it { should match_fhir_json(support_file('base/annotation-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('note', builder) }

      it { should match_fhir_xml(support_file('base/annotation-simple.xml')) }
    end
  end

  context 'complete with author string' do
    let(:object) { yaml_load('base/annotation-complete-author-string.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/annotation', formats: :fhirj, locals: {annotation: object} }

      it { should match_fhir_json(support_file('base/annotation-complete-author-string.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('note', builder) }

      it { should match_fhir_xml(support_file('base/annotation-complete-author-string.xml'))  }
    end
  end

  context 'complete with author reference' do
    let(:object) { yaml_load('base/annotation-complete-author-ref.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/annotation', formats: :fhirj, locals: {annotation: object} }

      it { should match_fhir_json(support_file('base/annotation-complete-author-ref.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('note', builder)  }

      it { should match_fhir_xml(support_file('base/annotation-complete-author-ref.xml')) }
    end
  end
end