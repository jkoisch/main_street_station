require 'rails_helper'
require 'support/fhir_matchers'

describe 'Family History Request FHIR API', type: :request do
  describe 'GET /fhir/FamilyHistory' do
    it { should return_FHIR_JSON_bundle_object('FamilyHistory') }

    it 'should return_HTTP_success_for FamilyHistory.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/FamilyHistory.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/FamilyHistory.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/FamilyHistory.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/FamilyHistory/1.json' do
    it { should return_FHIR_JSON_object('FamilyHistory') }

    it { should return_HTTP_success_for('FamilyHistory/1.json') }
  end
end