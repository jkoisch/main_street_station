require 'spec_helper'

describe 'Secure API' do

  describe 'Token management' do
    before(:each) do
      # set the valid token
      # override the validate_authenticity_token method to use the valid_token below
      MainStreetStation::Application.config.fhir_enforce_security = true
    end

    let(:user) { User.create!(email: 'temp@me.com', password: '123abc') }
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
      current_token = UserToken.create!(user: user)
      get '/fhir/Observations', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(current_token.authentication_token)
      response.status.should be(200)
    end

    it "should do return 'Not Authorized' with an expired token" do
      user_token = UserToken.create!(user: user)
      user_token.authentication_expiry = Time.now - 30.seconds
      user_token.save!
      get '/fhir/Observations', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(user_token.authentication_token)
      response.status.should be(401)
    end

    after(:each) do
      MainStreetStation::Application.config.fhir_enforce_security = false
    end
  end

end