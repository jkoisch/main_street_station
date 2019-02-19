require 'rails_helper'

describe 'UserToken' do
  let(:user) { FactoryBot.create(:user, email: Faker::Internet.email) }

  it 'should generate a new instance' do
    UserToken.create! do |ut|
      ut.user = user
    end
  end

  describe 'when created' do
    let(:user_token) { UserToken.create!(user: user) }

    it 'should be active' do
      expect(user_token.authentication_active?).to eq true
    end

    it 'should be refreshable' do
      expect(user_token.refreshable?).to eq true
    end
  end

  describe 'when stored' do
    let(:user_token) { UserToken.create!(user: user) }

    it 'should be a valid authentication token' do
      token = user_token.authentication_token

      expect(UserToken.is_valid_auth_token(token)).to eq true
    end

    it 'should be a valid refresh token' do
      token = user_token.refresh_token

      expect(UserToken.is_valid_refresh_token(token)).to eq true
    end
  end

  describe 'valid authentication regenerate' do
    let(:user_token) { UserToken.create!(user: user) }

    it 'should generate a new authentication when still able to refresh' do
      expect { user_token.refresh_authentication.save }.not_to raise_exception
    end

    it 'should generate a different authentication token when it refreshes' do
      token = user_token.authentication_token
      user_token.refresh_authentication
      expect(token).not_to eq(user_token.authentication_token)
    end

    it 'should not generate a new authentication past end of refresh' do
      user_token.refresh_expiry = Time.now + 2.minutes
      user_token.refresh_authentication
      expect(user_token.authentication_expiry).to eq(user_token.refresh_expiry)
    end
  end

  describe 'when authentication has expired but refresh is OK' do
    let (:user_token) { UserToken.create(user: user) }

    it 'should not be valid' do
      user_token.authentication_expiry = Time.now - 30.seconds
      token = user_token.authentication_token
      user_token.save!
      expect(UserToken.is_valid_auth_token(token)).to eq false
    end

    it 'should not be active' do
      user_token.authentication_expiry = Time.now - 30.seconds
      expect(user_token.authentication_active?).to eq false
    end
  end

  describe 'when refresh has expired' do
    let (:user_token) { UserToken.create(user: user) }

    it 'should not be refreshable' do
      user_token.refresh_expiry = Time.now
      expect(user_token.refreshable?).to eq false
    end

    it 'should not be a valid refresh token' do
      user_token.refresh_expiry = Time.now - 30.seconds
      user_token.save
      token = user_token.refresh_token
      expect(UserToken.is_valid_refresh_token(token)).to eq false
    end

    it 'should throw an exception when asked to generate a new authentication token' do
      user_token.refresh_expiry = Time.now - 30.seconds
      expect { user_token.refresh_authentication }.to raise_exception
    end
  end
end