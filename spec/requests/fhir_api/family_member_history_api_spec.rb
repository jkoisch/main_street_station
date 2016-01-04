require 'rails_helper'
require 'support/fhir_matchers'

describe 'Family History Request FHIR API', type: :request do
  describe 'GET /fhir/FamilyMemberHistory' do

    context 'JSON' do
      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

        it 'should return a FHIR Bundle' do
          get '/fhir/FamilyMemberHistory'
          expect(response).to return_FHIR_JSON_bundle('FamilyMemberHistory')
        end

        it 'should have success status (2xx)' do
          get '/fhir/FamilyMemberHistory'
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/FamilyMemberHistory'
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          expect(get '/fhir/FamilyMemberHistory').to render_template('fhir_base/operation_outcome')
        end
      end
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/xml'} }

      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

        it 'should return a FHIR Bundle' do
          get 'fhir/FamilyMemberHistory', {}, headers
          expect(response).to return_FHIR_XML_bundle('FamilyMemberHistory')
        end

        it 'should have success status (2xx)' do
          get 'fhir/FamilyMemberHistory', {}, headers
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/FamilyMemberHistory', {}, headers
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          get '/fhir/FamilyMemberHistory', {}, headers
          expect(response).to render_template('fhir_base/operation_outcome')
          expect(response.content_type).to eq :xml
        end
      end
    end

    it { should return_FHIR_JSON_bundle_object('FamilyMemberHistory') }

    it 'should return_HTTP_success_for FamilyMemberHistory.json' do
      GringottResponse.any_instance.stubs(:success?).returns(true)
      expect(get '/fhir/FamilyMemberHistory.json'). to eq 200
    end

    it 'should return error for failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/FamilyMemberHistory.json').to eq 500
    end

    it 'should render OperationOutcome for a failure' do
      GringottResponse.any_instance.stubs(:success?).returns(false)
      expect(get '/fhir/FamilyMemberHistory.json').to render_template('fhir_base/operation_outcome')
    end
  end

  describe 'GET /fhir/FamilyMemberHistory/1.json' do
    context 'JSON' do
      it { should return_FHIR_JSON_object('FamilyMemberHistory') }

      it { should return_HTTP_success_for('FamilyMemberHistory/1.json') }
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/xml'} }

      context 'success' do
        it 'should return a FHIR resource' do
          get 'fhir/FamilyMemberHistory/1', {}, headers
          expect(response).to return_FHIR_XML_object('FamilyMemberHistory')
        end

        it 'should have success status (2xx)' do
          get 'fhir/FamilyMemberHistory/1', {}, headers
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end