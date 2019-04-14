require 'rails_helper'

describe 'Questionnaire Request FHIR API', type: :request do
  describe 'GET /fhir/Questionnaire' do
    context 'JSON' do
      it { should return_FHIR_JSON_bundle_object('Questionnaire') }

      it 'should return_HTTP_success_for Questionnaire' do
        GringottResponse.any_instance.stubs(:success?).returns(true)
        expect(get '/fhir/Questionnaire'). to eq 200
      end

      it 'should return error for failure' do
        GringottResponse.any_instance.stubs(:success?).returns(false)
        expect(get '/fhir/Questionnaire').to eq 500
      end

      it 'should render OperationOutcome for a failure' do
        GringottResponse.any_instance.stubs(:success?).returns(false)
        expect(get '/fhir/Questionnaire').to render_template('fhir_base/operation_outcome')
      end
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/fhir+xml'} }

      it 'should return_HTTP_success_for Questionnaire' do
        GringottResponse.any_instance.stubs(:success?).returns(true)
        expect(get '/fhir/Questionnaire', params: {}, headers: headers). to eq 200
      end

      it 'should return error for failure' do
        GringottResponse.any_instance.stubs(:success?).returns(false)
        expect(get '/fhir/Questionnaire', params: {}, headers: headers).to eq 500
      end

      it 'should render OperationOutcome for a failure' do
        GringottResponse.any_instance.stubs(:success?).returns(false)
        expect(
            get '/fhir/Questionnaire', params: {}, headers: headers
        ).to render_template('fhir_base/operation_outcome')
      end
    end
  end

  describe 'GET /fhir/Questionnaire/1' do
    it { should return_FHIR_JSON_object('Questionnaire') }

    it { should return_HTTP_success_for('Questionnaire/1') }
  end

  describe 'GET /fhir/Questionnaire/n not found' do
    it { should return_an_OperationOutcome_when_failing_for('Questionnaire/2') }

    it { should_not return_HTTP_success_for('Questionnaire/2') }
  end
end