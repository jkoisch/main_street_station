require 'spec_helper'

describe "FHIR Conformance Output Formatting" do
  describe "conformance/show.json.jbuilder" do

  end
  before(:each) do
    @staff = assign(:staff, stub_model(Staff))
  end

  it {should produce_fhir_json('spec/support-files/fhir-conformance.json')}

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
