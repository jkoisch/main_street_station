require 'spec_helper'
require 'support/fhir_matchers'

describe 'Patient' do
  describe 'GET /fhir/Patient' do
    it { should return_FHIR_JSON_bundle_object('Patient') }

    it { should return_HTTP_success_for('Patient.json') }

    it {should return_an_OperationOutcome_when_failing_for('Patient.json')}
  end

  describe 'GET /fhir/Patient/1.json' do
    it { should return_FHIR_JSON_object('Patient') }

    it { should return_HTTP_success_for('Patient/1.json') }

    it {should return_an_OperationOutcome_when_failing_for('Patient/1.json')}
  end
end