require 'spec_helper'

describe SessionService do
  let(:valid_pw) { '123temp' }
  let(:user) {User.create(email: 'temp@youcentric.com', password: valid_pw, password_confirmation: valid_pw)}

  context 'authentication' do
    it 'should authenticate a valid user' do
      expect(SessionService.authenticate(user, valid_pw)).to be_true
    end

    it 'should reject an invalid user' do
      expect(SessionService.authenticate(nil, valid_pw)).to be_false
    end

    it 'should reject an invalid password' do
      expect(SessionService.authenticate(user, '123tem')).to be_false
    end
  end

  context 'multiple session management' do
    it 'should return an existing token when an active session exists' do
      ut = user.user_tokens.create
      SessionService.authenticate(user, valid_pw)
      expect(user.user_tokens.current[0].authentication_token).to eq(ut.authentication_token)
    end

    it 'should return a new token if none of the existing tokens are active' do
      ut = user.user_tokens.create()
      ut.update(authentication_expiry: Time.now - 1.minute)
      SessionService.authenticate(user, valid_pw)
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
      expect {
        SessionService.authenticate(user, valid_pw) }.to change{user.sign_in_count}.by(1)
    end

    it 'should update the current login at for a successful login' do
      expect {
        SessionService.authenticate(user, valid_pw) }.to change(user, :current_sign_in_at)
    end

    it 'should update the last login if a previous login exists' do
      user.current_sign_in_at = Time.now - 1.day
      expect {
        SessionService.authenticate(user, valid_pw) }.to change(user, :last_sign_in_at)
    end

    it 'should not update the last login if no previous login exists' do
      expect {
        SessionService.authenticate(user, valid_pw) }.to_not change(user, :last_sign_in_at)
    end
  end
end