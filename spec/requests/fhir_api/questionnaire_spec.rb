require 'spec_helper'
require 'support/fhir_matchers'

describe "Questionnaire" do
  describe "GET /fhir/Questionnaire" do
    it { should return_FHIR_JSON_bundle_object("Questionnaire") }

    it { should return_HTTP_success_for('Questionnaire.json') }

    it "should return an OperationOutcome for something bad"
  end

  describe 'GET /fhir/Questionnaire/1.json' do
    it { should return_FHIR_JSON_object("Questionnaire") }

    it { should return_HTTP_success_for('Questionnaire/1.json') }
  end
end