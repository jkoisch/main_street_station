require 'spec_helper'

describe SessionService do
  let(:user) {User.create(email: 'temp@youcentric.com', password: '123temp', password_confirmation: '123temp')}

  context 'authentication' do
    it 'should authenticate a valid user' do
      params = {"password" => "123temp"}
      expect(SessionService.authenticate(user, params)).to be_true
    end

    it 'should reject an invalid user' do
      params = {"password" => "123temp"}
      expect(SessionService.authenticate(nil, params)).to be_false
    end

    it 'should reject an invalid password' do
      params = {"password" => "123tem"}
      expect(SessionService.authenticate(user, params)).to be_false
    end
  end

  context 'multiple session management' do
    it 'should return an existing token when an active session exists' do
      ut = user.user_tokens.create
      params = {"password" => "123temp"}
      SessionService.authenticate(user, params)
      expect(user.user_tokens.current[0].authentication_token).to eq(ut.authentication_token)
    end

    it 'should return a new token if none of the existing tokens are active' do
      ut = user.user_tokens.create()
      ut.update(authentication_expiry: Time.now - 1.minute)
      params = {"password" => "123temp"}
      SessionService.authenticate(user, params)
      expect(user.user_tokens.current[0].authentication_token).to_not eq(ut.authentication_token)
    end
  end

  context 'session cleanup' do
    it 'should remove the current session token' do
      ut = user.user_tokens.create()
      SessionService.cleanup(ut.authentication_token)
      expect(user.user_tokens.current.count).to eq 0
    end

    it 'should cleanup any old tokens for the user' do
      ut = user.user_tokens.create()
      ut.update(authentication_expiry: Time.now - 1.minute)
      ut = user.user_tokens.create()
      ut.update(authentication_expiry: Time.now - 1.minute)
      ut = user.user_tokens.create()
      SessionService.cleanup(ut.authentication_token)
      expect(user.user_tokens.count).to eq 0
    end
  end

  context 'user stats' do
    it 'should update the login count for each successful login' do
      params = {"password" => "123temp"}
      expect {
        SessionService.authenticate(user, params) }.to change{user.sign_in_count}.by(1)
    end

    it 'should update the current login at for a successful login' do
      params = {"password" => "123temp"}
      expect {
        SessionService.authenticate(user, params) }.to change(user, :current_sign_in_at)
    end

    it 'should update the last login if a previous login exists' do
      user.current_sign_in_at = Time.now - 1.day
      params = {"password" => "123temp"}
      expect {
        SessionService.authenticate(user, params) }.to change(user, :last_sign_in_at)
    end

    it 'should not update the last login if no previous login exists' do
      params = {"password" => "123temp"}
      expect {
        SessionService.authenticate(user, params) }.to_not change(user, :last_sign_in_at)
    end
  end
end