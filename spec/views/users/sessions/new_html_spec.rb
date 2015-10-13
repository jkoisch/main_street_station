require 'rails_helper'
include DeviseHelpers

RSpec.describe 'users/sessions/new', type: :view do
  before(:each) { render }

  it 'renders the new template' do
    expect(view).to render_template(:new)
    expect(view).to render_template('new')
    expect(view).to render_template('users/sessions/new')
  end
end