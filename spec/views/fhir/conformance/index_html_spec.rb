require 'rails_helper'

RSpec.describe 'fhir/conformance/index', type: :view do
  before(:all)  { @conformances = [ Fhir::Conformance.parse_ehmbr(LocalResource.get_local_resource_data('conformance')) ] }
  before(:each) { render }

  it 'renders the index template' do
    expect(view).to render_template(:index)
    expect(view).to render_template('index')
    expect(view).to render_template('fhir/conformance/index')
  end

  it 'shows the software version' do
    expect(rendered).to match(@conformances[0].version)
  end

  it 'shows the FHIR version' do
    expect(rendered).to match('FHIR v' + @conformances[0].fhir_version)
  end

  it 'should have a link to something'
end