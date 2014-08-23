require 'spec_helper'

describe 'Authentication API', type: :request do
  before(:each) do
    # set the valid token
    # override the validate_authenticity_token method to use the valid_token below
    # noinspection RubyResolve
    MainStreetStation::Application.config.fhir_enforce_security = true
  end


  describe '- user verification' do
    describe ' - internal' do
      let(:user) { User.create!(email: Faker::Internet.email, password: '123abc') }

      it 'should allow a user to log in' do
        post '/login', {user_name: user.email, password: '123abc'}
        expect(response.status).to eq 200
      end

      it 'should reject a user that does not exist' do
        bad_email = user.email.tr('aei', '123')
        post '/login', {user_name: bad_email, password: '123abc'}
        expect(response.status).to eq 401
      end
    end

    describe ' - OAuth' do
      it 'should be tested'
    end
  end

  describe '- token management' do
    let(:user) { User.create!(email: Faker::Internet.email, password: '123abc') }

    it 'should fail with an invalid token' do
      get '/fhir/Observation', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials('123456')
      expect(response.status).to eq 401
    end

    it 'should fail without a token' do
      get '/fhir/Observation'
      expect(response.status).to eq 401
    end

    it 'should pass with a valid token' do
      current_token = UserToken.create!(user: user)
      get '/fhir/Observation', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(current_token.authentication_token)
      expect(response.status).to eq 200
    end

    it "should do return 'Not Authorized' with an expired token" do
      user_token = UserToken.create!(user: user)
      # noinspection RubyResolve
      user_token.authentication_expiry = Time.now - 30.seconds
      user_token.save!
      get '/fhir/Observation', nil,
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(user_token.authentication_token)
      expect(response.status).to eq 401
    end
  end

  after(:each) do
    # noinspection RubyResolve
    MainStreetStation::Application.config.fhir_enforce_security = false
  end
end