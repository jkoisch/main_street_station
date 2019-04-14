require 'rails_helper'
require 'fhir/types/attachment'
require 'builder'

describe 'FHIR base-type Attachment', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/attachment-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/attachment', formats: :fhirj, locals: {attachment: object} }

      it { should match_fhir_json(support_file('base/attachment-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('picture', builder) }

      it { should match_fhir_xml(support_file('base/attachment-simple.xml')) }
    end
  end
end