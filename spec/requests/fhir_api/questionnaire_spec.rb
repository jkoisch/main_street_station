require 'spec_helper'

describe 'Questionnaire' do
  describe 'GET /fhir/Questionnaire' do
    it { should return_FHIR_JSON_bundle_object('Questionnaire') }

    it { should return_HTTP_success_for('Questionnaire.json') }

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Questionnaire.json').to be_a(500)
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/Questionnaire.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/Questionnaire/1.json' do
    it { should return_FHIR_JSON_object('Questionnaire') }

    it { should return_HTTP_success_for('Questionnaire/1.json') }
  end

  describe 'GET /fhir/Questionnaire/n.json not found' do
    it { should return_an_OperationOutcome_when_failing_for('Questionnaire/2.json') }

    it { should_not return_HTTP_success_for('Questionnaire/2.json') }
  end
end