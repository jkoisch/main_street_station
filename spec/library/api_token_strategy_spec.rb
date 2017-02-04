require 'rails_helper'

RSpec.describe ApiTokenStrategy, type: :model do

  let!(:user) { User.create(email: 'user@example.com') }

  let!(:user_token) { UserToken.create(user_id: user.id, authentication_token: 'token', authentication_expiry: DateTime.current) }

  let('env') { {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(user_token.authentication_token) } }

  let(:subject) { described_class.new(nil) }

  describe 'valid?' do
    context 'with valid credentials' do
      before { subject.stubs(:env).returns(env) }

      it 'should validate an authorization token' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid credentials' do
      before { subject.stubs(:env).returns({}) }

      it { is_expected.not_to be_valid }
    end
  end

  describe '#authenticate!' do
    context 'with valid credentials' do
      before { subject.stubs(:env).returns(env) }

      it 'should return success' do
        subject.expects(:success!).with(user)
        subject.authenticate!
      end
    end

    context 'with invalid token' do
      before {
        subject.stubs(:env).returns( {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials('invalid-token') })
      }

      it 'should fail using an invalid token' do
        subject.expects(:success!).never
        subject.expects(:fail!)

        subject.authenticate!
      end
    end

    context 'with expired token' do
      it 'should be tested'
    end
  end
end
