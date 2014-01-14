require 'spec_helper'

  describe "fhir/conformance/show.json.jbuilder" do
    before do

      @conformance = Fhir::Conformance.new(identifier: "x-1", name: "test",
                                           version: "0.1",
                                           telecom: [Fhir::Types::Contact.new(system: 'email', value: 'theblackdot@gmail.com')])
    end

    #it {should produce_fhir_json_like('spec/support-files/fhir-conformance.json')}

    it "should produce formatted FHIR JSON" do
      assign(:conformance, @conformance)
      temp = render partial: 'fhir/conformance/conformance.json.jbuilder',
                    locals: {resource: @conformance}
      puts "local"
      puts rendered
      puts temp
    end

  end
#  before(:each) do
#    @staff = assign(:staff, stub_model(Staff))
#  end

#  it "renders attributes in <p>" do
#    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
#  end
