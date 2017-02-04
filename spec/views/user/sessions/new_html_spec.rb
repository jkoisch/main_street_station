require 'rails_helper'

RSpec.describe 'user/sessions/new', type: :view do
  before(:each) do
    assign(:user_sign_in, UserSignIn.new)
    render
  end

  it 'renders the new template' do
    expect(view).to render_template(:new)
    expect(view).to render_template('new')
    expect(view).to render_template('user/sessions/new')
  end

  it 'should have screen title' do
    expect(rendered).to have_selector("h2:contains('Create Session')")
  end

  it 'should have a email address input field' do
    expect(rendered).to have_field('Email address')
  end

  it 'should have a password input field' do
    expect(rendered).to have_field('Password')
  end

  it 'should have a sign in button' do
    expect(rendered).to have_button('Log in')
  end

  it 'should not have a sign in link' do
    pending 'work out link'
    expect(rendered).not_to have_link('Sign in')
  end

  it 'should have a link to forgotten password' do
    expect(rendered).to have_link('Forgot your password?')
  end

  it 'should have a link to sign in with Facebook' do
    pending 'more to come'
    expect(rendered).to have_link('Sign in with Facebook')
  end

  it 'should have a link to sign in with Google' do
    pending 'more to come'
    expect(rendered).to have_link('Sign in with Google')
  end

  it 'should return to login with invalid login'
  #could not get redirect to work, Andy will investigate.
 end