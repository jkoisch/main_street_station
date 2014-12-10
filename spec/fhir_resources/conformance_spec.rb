require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Conformance do
  subject { Fhir::Conformance }

  it { should parse_ehmbr_response('config/conformance.json') }

  context 'with valid conformance resource' do
    before(:each) do
      @body = JSON.parse(File.read('config/conformance.json'))
    end

    it 'should validate presence of fhir_version' do
      expect(@body.has_key?('fhir_version')).to be true
    end

    it 'should validate presence of fhir_version value' do
      expect(@body['fhir_version']).to_not be_nil
    end
  end
end