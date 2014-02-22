require 'spec_helper'

describe 'Secure API' do

  describe 'Get /Observation' do
    before(:each) do
      # set the valid token
      # override the validate_authenticity_token method to use the valid_token below
    end

    let(:valid_token) { "abcdefg" }

    it 'should fail with an invalid token' do
      get '/fhir/Observations', nil, {'HTTP_AUTHORIZATION' => "TOKEN=123456"}
      response.status.should be(401)
    end

    it 'should pass with a valid token' do
      get '/fhir/Observations', nil, {'HTTP_AUTHORIZATION' => "TOKEN=#{valid_token}"}
      response.status.should be(200)
    end
  end

end