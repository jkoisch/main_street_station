require 'rails_helper'
include DeviseHelpers

RSpec.describe 'users/registrations/new', type: :view do
  before(:each) { render }

  it 'renders the new template' do
    expect(view).to render_template(:new)
    expect(view).to render_template('new')
    expect(view).to render_template('users/registrations/new')
  end

  it 'should show something'

  it 'should have a field to enter something'

  it 'should have a link to something'
end