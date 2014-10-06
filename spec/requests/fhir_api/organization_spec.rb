require 'rails_helper'
require 'support/fhir_matchers'

describe 'Organization Request FHIR API', type: :request do
  describe 'GET /fhir/Organization' do
    it { should return_FHIR_JSON_bundle_object('Organization') }

    it 'should return_HTTP_success_for Organization.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Organization.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Organization.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Organization.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Organization/1.json' do
    it { should return_FHIR_JSON_object('Organization') }

    it { should return_HTTP_success_for('Organization/1.json') }
  end
end