require 'rails_helper'

describe 'Patient Request FHIR API', type: :request do
  describe 'GET /fhir/Patient' do

    context 'JSON' do
      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

        it 'should return a FHIR Bundle' do
          get '/fhir/Patient'
          expect(response).to return_FHIR_JSON_bundle('Patient')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Patient'
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/Patient'
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          expect(get '/fhir/Patient').to render_template('fhir_base/operation_outcome')
        end
      end
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/fhir+xml'} }

      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success).returns(true) }

        it 'should return a FHIR Bundle' do
          get '/fhir/Patient', params: {},  headers: headers
          expect(response).to return_FHIR_XML_bundle('Patient')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Patient', params: {}, headers: headers
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/Patient', params: {}, headers: headers
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          get '/fhir/Patient', params: {}, headers: headers
          expect(response).to render_template('fhir_base/operation_outcome')
          expect(response.content_type).to eq Mime[:fhirx]

        end
      end
    end
  end

  describe 'GET /fhir/Patient/1' do
    context 'JSON' do
      it { should return_FHIR_JSON_object('Patient') }
      it { should return_HTTP_success_for('Patient/1.fhirj') }
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/fhir+xml'} }

      context 'success' do
        it 'should return a FHIR resource' do
          get '/fhir/Patient/1', params: {}, headers: headers
          expect(response).to return_FHIR_XML_object('Patient')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Patient/1', params: {}, headers: headers
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end