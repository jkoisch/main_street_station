require 'rails_helper'
require 'support/fhir_matchers'

describe 'Patient Request FHIR API', type: :request do
  describe 'GET /fhir/Patient' do
    it { should return_FHIR_JSON_bundle_object('Patient') }

    it 'should return_HTTP_success_for Patient.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Patient.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Patient.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Patient.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Patient/1.json' do
    it { should return_FHIR_JSON_object('Patient') }

    it { should return_HTTP_success_for('Patient/1.json') }

    it {should return_an_OperationOutcome_when_failing_for('Patient/1.json')}
  end
end