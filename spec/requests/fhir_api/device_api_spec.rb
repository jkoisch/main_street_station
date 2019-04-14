require 'rails_helper'

describe 'Device Request FHIR API', type: :request do
  describe 'GET /fhir/Device' do

    context 'JSON' do
      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

          it 'should return a FHIR Bundle' do
            get '/fhir/Device'
            expect(response).to return_FHIR_JSON_bundle('Device')
          end

          it 'should have success status (2xx)' do
            get '/fhir/Device'
            expect(response).to have_http_status(:success)
          end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/Device'
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          expect(get '/fhir/Device').to render_template('fhir_base/operation_outcome')
        end
      end
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/fhir+xml'} }

      context 'success' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(true) }

        it 'should return a FHIR Bundle' do
          get '/fhir/Device', params: {}, headers: headers
          expect(response).to return_FHIR_XML_bundle('Device')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Device', params: {}, headers: headers
          expect(response).to have_http_status(:success)
        end
      end

      context 'failure' do
        before(:each) { GringottResponse.any_instance.stubs(:success?).returns(false) }

        it 'should return error status' do
          get '/fhir/Device', params: {}, headers: headers
          expect(response).to have_http_status(:error)
        end

        it 'should render OperationOutcome' do
          get '/fhir/Device', params: {}, headers: headers
          expect(response).to render_template('fhir_base/operation_outcome')
          expect(response.content_type).to eq Mime[:fhirx]
        end
      end
    end
  end

  describe 'GET /fhir/Device/1' do
    context 'JSON' do
      it { should return_FHIR_JSON_object('Device') }

      it { should return_HTTP_success_for('Device/1') }
    end

    context 'XML' do
      let(:headers) { {'Accept' => 'application/fhir+xml'} }

      context 'success' do
        it 'should return a FHIR resource' do
          get '/fhir/Device/1', params: {}, headers: headers
          expect(response).to return_FHIR_XML_object('Device')
        end

        it 'should have success status (2xx)' do
          get '/fhir/Device/1', params: {}, headers: headers
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end