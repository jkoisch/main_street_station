require 'rails_helper'
require 'fhir/location'
require 'builder'

describe 'FHIR View Location Position', type: :view do
  context 'partial' do

    context 'simple' do
      let(:object) { yaml_load('locations/position-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/locations/position', formats: :json, locals: {position: object} }

        it { should match_fhir_json(support_file('locations/position-standard.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('position', builder) }

        it { should match_fhir_xml(support_file('locations/position-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('locations/position-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/locations/position', formats: :json, locals: {position: object} }

        it { should match_fhir_json(support_file('locations/position-complete.json')) }
      end

      context 'xml' do
        let(:builder) { Builder::XmlMarkup.new() }
        subject       { object.to_xml('position', builder) }

        it { should match_fhir_xml(support_file('locations/position-complete.xml')) }
      end
    end
  end
end