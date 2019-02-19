require 'rails_helper'

describe ApplicationController, type: :controller do

  describe '#user_signed_in?' do
    it 'returns false with no user' do
      expect(subject.user_signed_in?).to eq false
    end

    it 'returns true with a user' do
      warden.set_user FactoryBot.create(:user)
      expect(subject.user_signed_in?).to eq true
    end
  end

  describe '#current_user' do
    it 'returns the defined user' do
      user = FactoryBot.create(:user)
      warden.set_user user
      expect(subject.current_user.email).to eq(user.email)
    end
  end

end