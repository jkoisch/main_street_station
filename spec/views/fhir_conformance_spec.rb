require 'spec_helper'
require 'fhir/conformance'

  describe 'fhir/conformance/conformance' do
    let(:resource) { YAML.load(File.read('spec/support-files/conformance.yaml')) }

    it {should produce_fhir_json_like('spec/support-files/fhir-conformance.json')}
    it {should produce_fhir_xml_like('spec/support-files/fhir-conformance.xml')}
  end

#  before(:each) do
#    @staff = assign(:staff, stub_model(Staff))
#  end

#  it "renders attributes in <p>" do
#    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
#  end
