require 'spec_helper'
require 'support/fhir_matchers'

describe 'Device' do
  describe 'GET /fhir/Device' do
    it { should return_FHIR_JSON_bundle_object('Device') }

    it 'should return_HTTP_success_for Device.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Device.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Device.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Device.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Device/1.json' do
    it { should return_FHIR_JSON_object('Device') }

    it { should return_HTTP_success_for('Device/1.json') }
  end
end