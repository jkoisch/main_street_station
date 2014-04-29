require 'spec_helper'
require 'support/fhir_matchers'

describe "Condition" do
  describe "GET /fhir/Condition" do
    it { should return_FHIR_JSON_bundle_object("Condition") }

    it { should return_HTTP_success_for('Condition.json') }

    it "should return an OperationOutcome for something bad"
  end

  describe 'GET /fhir/Condition/1.json' do
    it { should return_FHIR_JSON_object("Condition") }

    it { should return_HTTP_success_for('Condition/1.json') }
  end
end
