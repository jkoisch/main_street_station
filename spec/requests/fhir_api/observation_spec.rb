require 'spec_helper'
require 'support/fhir_matchers'

describe 'Observation' do
  describe 'GET /fhir/Observation' do
    it { should return_FHIR_JSON_bundle_object('Observation') }

    it { should return_HTTP_success_for('Observation.json') }

    it 'should return an OperationOutcome for something bad'
  end

  describe 'GET /fhir/Observation/1.json' do
    it { should return_FHIR_JSON_object('Observation') }

    it { should return_HTTP_success_for('Observation/1.json') }
  end
end