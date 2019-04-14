require 'rails_helper'

describe 'Conformance Request FHIR API', type: :request do
  describe 'GET /fhir/Conformance' do
    it 'should return the conformance' do
      get '/fhir/Conformance'
      expect(response).to have_http_status :success
    end
  end

  describe 'GET /fhir/Conformance/1' do
    it 'should execute the Conformance request' do
      get '/fhir/Conformance/1'
      expect(response).to have_http_status :success
    end
  end

  describe 'GET /fhir/metadata' do
    it 'should execute the Conformance request' do
      get '/fhir/metadata'
      expect(response).to have_http_status :success
    end
  end
end
