require 'spec_helper'
require 'support/fhir_matchers'

describe 'Observation' do
  describe 'GET /fhir/Observation' do
    it { should return_FHIR_JSON_bundle_object('Observation') }

    it 'should return_HTTP_success_for Observation.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Observation.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Observation.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Observation.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Observation/1.json' do
    it { should return_FHIR_JSON_object('Observation') }

    it { should return_HTTP_success_for('Observation/1.json') }
  end
end