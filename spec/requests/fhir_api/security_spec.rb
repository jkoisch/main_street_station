require 'spec_helper'

describe 'Secure API' do

  describe 'Get /Observation' do
    before(:each) do
      # set the valid token
      # override the validate_authenticity_token method to use the valid_token below
      MainStreetStation::Application.config.fhir_enforce_security = true
    end

    let(:valid_token) { UserToken.create(authentication_token: "abcdefg", authentication_expiry: DateTime.now + 5.minutes) }

    it 'should fail with an invalid token' do
      get '/fhir/Observations', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials('123456')
      response.status.should be(401)
    end

    it 'should fail without a token' do
      get '/fhir/Observations'
      response.status.should be(401)
    end

    it 'should pass with a valid token' do
      get '/fhir/Observations', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(valid_token.authentication_token)
      response.status.should be(200)
    end

    it 'should do *something* with an expired token'

    after(:each) do
      MainStreetStation::Application.config.fhir_enforce_security = false
    end
  end

end