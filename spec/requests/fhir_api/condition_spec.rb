require 'rails_helper'
require 'support/fhir_matchers'

describe 'Condition Request FHIR API', type: :request do
  describe 'GET /fhir/Condition' do
    it { should return_FHIR_JSON_bundle_object('Condition') }

    it 'should return HTTP success' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Condition.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Condition.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Condition.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Condition/1.json' do
    it { should return_FHIR_JSON_object('Condition') }

    it { should return_HTTP_success_for('Condition/1.json') }
  end
end
