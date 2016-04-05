require 'rails_helper'

describe 'User Registration', type: :feature do
  context 'with local authentication' do
    before(:each) do
      visit '/users/sign_up'

      fill_in 'user_email', with: ' mathew123@test.com'
      fill_in 'user_password', with: 'mathew123'
      fill_in 'user_password_confirmation', with: 'mathew123'
      click_button 'Sign up'
    end

    it 'returns to the main page after registration' do
      expect(page).to have_content('Welcome to Mainstreet Station')
    end

    it 'displays signed up but inactive' do
      expect(page).to have_content(I18n.t(:signed_up, scope: [:devise, :registrations]))
    end

    it 'send email confirmation'
  end

  context 'Google authentication' do
  end
end