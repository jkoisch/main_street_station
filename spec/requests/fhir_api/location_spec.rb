require 'rails_helper'

describe 'Location Request FHIR API', type: :request do
  describe 'GET /fhir/Location' do
    it { should return_FHIR_JSON_bundle_object('Location') }

    it 'should return_HTTP_success_for Location.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/Location.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Location.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Location.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Location/1.json' do
    it { should return_FHIR_JSON_object('Location') }

    it { should return_HTTP_success_for('Location/1.json') }
  end

  describe 'GET /fhir/Location/n.json not found' do
    it { should return_an_OperationOutcome_when_failing_for('Location/2.json') }

    it { should_not return_HTTP_success_for('Location/2.json') }
  end
end