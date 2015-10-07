require 'rails_helper'
require 'fhir/types/sampled_data'
require 'fhir/types/quantity'
require 'builder'

describe 'FHIR base-type SampledData', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/sampled_data-simple.yaml') }

    context 'JSON' do
      subject      { render partial: 'fhir/base/sampled_data', formats: :json, locals: {sampled_data: object} }

      it { should match_fhir_json(support_file('base/sampled_data-simple.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject       { object.to_xml('sampledData', builder) }

      it { should match_fhir_xml(support_file('base/sampled_data-simple.xml')) }
    end
  end
end