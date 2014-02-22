require 'spec_helper'

describe "Conformance" do
  describe "GET /fhir/Conformance" do
    it "should return the conformance" do
      get '/fhir/Conformance.json', nil
      response.status.should be(200)
    end
  end

  describe "GET /fhir/metadata" do
    it "should execute the Conformance request" do
      get '/fhir/metadata'
      response.status.should be(200)
    end
  end
end
