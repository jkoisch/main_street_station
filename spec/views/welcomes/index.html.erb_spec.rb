require 'rails_helper'

RSpec.describe "welcomes/index", :type => :view do

  it 'renders the index template' do
    render
    expect(view).to render_template(:index)
    expect(view).to render_template("index")
    expect(view).to render_template("welcomes/index")
  end

  it 'renders the welcome screen' do
    render
    expect(rendered).to match /Welcome to Mainstreet Station/
  end

  it 'renders the current FHIR Version' do
    render
    expect(rendered).to match /v0.5.0/
  end

  it 'renders a link to conformance' do
    render
    expect(rendered).to have_link 'Conformance', fhir_conformance_index_path
  end

  it 'renders a link to application sign up' do
    render
    expect(rendered).to have_link 'Signup', new_user_registration_path
  end
end
