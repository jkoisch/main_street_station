require 'rails_helper'
require 'fhir/types/period'
require 'builder'

describe 'FHIR base-type Period', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/period-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/period', formats: :fhirj, locals: {period: object} }

      it { should match_fhir_json(support_file('base/period-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('period', builder) }

      it { should match_fhir_xml(support_file('base/period-simple.xml')) }
    end
  end
end