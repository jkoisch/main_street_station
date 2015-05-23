require 'spec_helper'

RSpec.describe 'security page behavior' do


  context 'sign in, sign out' do
    let(:user) {User.create!(email: Faker::Internet.email, password: '123abc')}

    before(:each) do
      visit '/users/login'

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      click_button "Sign in"
    end

    it 'returns to the main page on user sign in' do
      expect(page).to have_content("Welcome #{user.email}")
      expect(page).to have_link('Logout')
      expect(page).to have_link('Edit profile')
    end

    it 'returns to the main page on user logout' do
      click_link "Logout"

      expect(page).to have_link("Login")
      expect(page).to have_link("Sign up")
    end

  end

  context 'sign up page behavior' do

    it 'returns to the main page when new user signs up' do
      visit '/users/sign_up'

      fill_in 'user_email', with: 'mathew123@test.com'
      fill_in 'user_password', with: 'mathew123'
      fill_in 'user_password_confirmation', with: 'mathew123'

      click_button 'Sign up'

      expect(page).to have_content("Welcome mathew123@test.com")
      expect(page).to have_link('Logout')
      expect(page).to have_link('Edit profile')
    end
  end

end
