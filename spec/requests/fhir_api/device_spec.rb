require 'spec_helper'
require 'support/fhir_matchers'

describe 'Device' do
  describe 'GET /fhir/Device' do
    it { should return_FHIR_JSON_bundle_object('Device') }

    it { should return_HTTP_success_for('Device.json') }

    it 'should return an OperationOutcome for something bad'
  end

  describe 'GET /fhir/Device/1.json' do
    it { should return_FHIR_JSON_object('Device') }

    it { should return_HTTP_success_for('Device/1.json') }
  end
end