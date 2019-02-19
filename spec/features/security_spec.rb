require 'rails_helper'

RSpec.describe 'security page behavior', type: :feature do

  context 'sign in, sign out' do
    let(:valid_pw)  { '123test' }
    let(:user)      { FactoryBot.create(:local_user, local_pw: valid_pw) }

    before(:each) do
      visit '/user/sessions/new'

      fill_in 'user_sign_in_email', with: user.email
      fill_in 'user_sign_in_password', with: valid_pw

      click_button 'Log in'
    end

    it 'returns to the main page on user sign in' do

      expect(page).to have_content('Welcome to Mainstreet Station')
      expect(page).to have_content("Welcome #{user.email}")
      expect(page).to have_link('Log out')
      expect(page).to have_link('Edit profile')
    end

    it 'returns to the main page on user log out' do
      click_link 'Log out'

      expect(page).to have_content('Welcome to Mainstreet Station')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Register')
    end
  end
end
