require 'rails_helper'

RSpec.describe 'user/registrations/new', type: :view do
  before(:each) do
    assign(:user, User.new)
    render
  end

  it 'renders the new template' do
    expect(view).to render_template(:new)
    expect(view).to render_template('new')
    expect(view).to render_template('user/registrations/new')
  end

  it 'should have title' do
    expect(rendered).to have_selector("h2:contains('Sign up')")
  end

  it 'should have a submit button' do
    expect(rendered).to have_button('Sign up')
  end

  it 'should have a field to enter an email address' do
    expect(rendered).to have_field('Email address')
  end

  it 'should have a field to enter a password' do
    expect(rendered).to have_field('Password')
  end

  it 'should have a field to enter a password confirmation' do
    expect(rendered).to have_field('Password confirmation')
  end

  it 'should have a link to sign in' do
    expect(rendered).to have_link('Sign in')
  end

  it 'should have a link to forgotten password' do
    expect(rendered).to have_link('Forgot your password?')
  end

  it 'should have a link to sign in with Facebook' do
    pending
    expect(rendered).to have_link('Sign in with Facebook')
  end

  it 'should have a link to sign in with Google' do
    pending
    expect(rendered).to have_link('Sign in with Google')
  end
end