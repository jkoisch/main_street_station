require 'spec_helper'

describe 'Questionnaire' do
  describe 'GET /fhir/Questionnaire' do
    it { should return_FHIR_JSON_bundle_object('Questionnaire') }

    it { should return_HTTP_success_for('Questionnaire.json') }
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