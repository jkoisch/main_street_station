require 'spec_helper'
require 'support/fhir_matchers'

describe 'Family History' do
  describe 'GET /fhir/FamilyHistory' do
    it { should return_FHIR_JSON_bundle_object('FamilyHistory') }

    it { should return_HTTP_success_for('FamilyHistory.json') }

    it 'should return an OperationOutcome for something bad'
  end

  describe 'GET /fhir/FamilyHistory/1.json' do
    it { should return_FHIR_JSON_object('FamilyHistory') }

    it { should return_HTTP_success_for('FamilyHistory/1.json') }
  end
end