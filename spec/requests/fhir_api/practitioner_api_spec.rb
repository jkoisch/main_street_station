require 'rails_helper'

describe 'Practitioner Request FHIR API', type: :request do
  describe 'GET /fhir/Practitioner' do
    it { should return_FHIR_JSON_bundle_object('Practitioner') }

    it 'should return_HTTP_success_for Practitioner.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Practitioner.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Practitioner.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Practitioner.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Practitioner/1.json' do
    it { should return_FHIR_JSON_object('Practitioner') }

    it { should return_HTTP_success_for('Practitioner/1.json') }
  end

  describe 'GET /fhir/Practitioner/n.json not found' do
    it { should return_an_OperationOutcome_when_failing_for('Practitioner/2.json') }

    it { should_not return_HTTP_success_for('Practitioner/2.json') }
  end
end