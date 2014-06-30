require 'spec_helper'

describe 'Authentication API' do

  describe 'Token management' do
    before(:each) do
      # set the valid token
      # override the validate_authenticity_token method to use the valid_token below
      # noinspection RubyResolve
      MainStreetStation::Application.config.fhir_enforce_security = true
    end

    let(:user) { User.create!(email: Faker::Internet.email, password: '123abc') }

    it 'should allow a user to log in'

    it 'should fail with an invalid token' do
      get '/fhir/Observation', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials('123456')
      response.status.should be(401)
    end

    it 'should fail without a token' do
      get '/fhir/Observation'
      response.status.should be(401)
    end

    it 'should pass with a valid token' do
      current_token = UserToken.create!(user: user)
      get '/fhir/Observation', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(current_token.authentication_token)
      response.status.should be(200)
    end

    it "should do return 'Not Authorized' with an expired token" do
      user_token = UserToken.create!(user: user)
      # noinspection RubyResolve
      user_token.authentication_expiry = Time.now - 30.seconds
      user_token.save!
      get '/fhir/Observation', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(user_token.authentication_token)
      response.status.should be(401)
    end

    after(:each) do
      # noinspection RubyResolve
      MainStreetStation::Application.config.fhir_enforce_security = false
    end
  end

end