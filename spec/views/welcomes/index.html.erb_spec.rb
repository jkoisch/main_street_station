require 'rails_helper'

RSpec.describe "welcomes/index", :type => :view do

  it 'renders the welcome screen' do
    render
    expect(rendered).to match /Welcome to Mainstreet Station/
  end

  it 'renders a link to conformance' do
    render
    expect(rendered).to have_link 'Conformance', fhir_metadata_path
  end

  it 'renders a link to application sign up' do
    render
    expect(rendered).to have_link 'Application User Signup', new_user_registration_path
  end

end
