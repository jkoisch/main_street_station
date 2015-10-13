require 'rails_helper'
require 'fhir/practitioner'
require 'builder'

describe 'FHIR Practitioner View', type: :view do
  before(:each) { controller.prepend_view_path 'app/views/fhir/practitioners' }

  context 'standard' do
    let(:resource) { yaml_load('practitioners/practitioner-standard.yaml') }

    context 'JSON' do
      subject { render(partial: 'practitioner', formats: :json, locals: {resource: resource}) }

      it {should match_fhir_json(support_file('practitioners/practitioner-standard.json')) }
    end

    context 'XML' do
      let(:builder) { Builder::XmlMarkup.new() }
      subject { resource.to_xml(nil, builder, true) }

      it {should match_fhir_xml(support_file('practitioners/practitioner-standard.xml'))  }
    end
  end
end
