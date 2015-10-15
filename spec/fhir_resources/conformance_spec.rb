require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Conformance do
  subject { Fhir::Conformance }

  it { should parse_ehmbr_response('config/conformance.json') }

  context 'with valid conformance resource' do
    before(:each) do
      @body = JSON.parse(File.read('config/conformance.json'))
    end

    it 'should validate presence of required element fhir_version' do
      expect(@body.has_key?('fhir_version')).to be true
    end

    it 'should validate presence of required element fhir_version value' do
      expect(@body['fhir_version']).to_not be_nil
    end

    it 'should validate presence of required element kind' do
      expect(@body.has_key?('kind')).to be true
    end

    it 'should validate presence of required element kind value' do
      expect(@body['kind']).to_not be_nil
    end

    it 'should validate presence of required element accept_unknown' do
      expect(@body.has_key?('accept_unknown')).to be true
    end

    it 'should validate presence of required element accept_unknown value' do
      expect(@body['accept_unknown']).to_not be_nil
    end

    it 'should validate presence of required element format' do
      expect(@body.has_key?('format')).to be true
    end

    it 'should validate presence of required element format value' do
      expect(@body['format']).to_not be_empty
    end

    it 'should validate presence of required element date' do
      expect(@body.has_key?('date')).to be true
    end

    it 'should validate presence of required element date element value' do
      expect(@body['date']).to_not be_nil
    end
  end
end