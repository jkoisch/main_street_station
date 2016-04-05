require 'rails_helper'

describe 'Location Request FHIR API', type: :request do
  describe 'GET /fhir/Location' do

    context 'JSON' do
      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

        it 'should return a FHIR Bundle' do
          get '/fhir/Location'
          expect(response).to return_FHIR_JSON_bundle('Location')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Location'
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/Location'
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          expect(get '/fhir/Location').to render_template('fhir_base/operation_outcome')
        end
      end
    end


    context 'XML' do
      let(:headers) { {'Accept' => 'application/xml'} }

      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

        it 'should return a FHIR Bundle' do
          get '/fhir/Location', {}, headers
          expect(response).to return_FHIR_XML_bundle('Location')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Location', {}, headers
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/Location', {}, headers
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          get '/fhir/Location', {}, headers
          expect(response).to render_template('fhir_base/operation_outcome')
          expect(response.content_type).to eq :xml
        end
      end
    end
  end

  describe 'GET /fhir/Location/1' do
    context 'JSON' do
      it { should return_FHIR_JSON_object('Location') }

      it { should return_HTTP_success_for('Location/1.json') }
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/xml'} }

      context 'success' do
        it 'should return a FHIR resource' do
          get '/fhir/Location/1', {}, headers
          expect(response).to return_FHIR_XML_object('Location')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Location/1', {}, headers
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end