require 'rails_helper'

RSpec.describe "welcomes/index", :type => :view do
  before(:all)  { @conformance = Fhir::Conformance.parse_ehmbr(LocalResource.get_local_resource_data('conformance')) }
  before(:each) { render }

  it 'renders the index template' do
    expect(view).to render_template(:index)
    expect(view).to render_template('index')
    expect(view).to render_template("welcomes/index")
  end

  it 'renders the welcome screen' do
    expect(rendered).to match /Welcome to Mainstreet Station/
  end

  it 'renders the current FHIR Version' do
    expect(rendered).to match "FHIR.* v#{@conformance.fhir_version}"
  end

  it 'renders a link to conformance' do
    expect(rendered).to have_link 'Conformance', fhir_conformance_index_path
  end

  it 'renders a link to application registration' do
    expect(rendered).to have_link 'Register', new_user_registration_path
  end

  context 'when logged in' do
    it 'should show user email'
  end
end
