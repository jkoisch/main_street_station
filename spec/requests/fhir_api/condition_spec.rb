require 'spec_helper'

describe "Condition" do
  describe "GET /fhir/Condition_General" do
    it "should return a general condition" do
      get '/fhir/Condition.json', nil
      response.status.should be(200)
    end
  end

  describe "GET /fhir/metadata" do
    it "should execute the Condition request" do
      get '/fhir/metadata'
      response.status.should be(200)
    end
  end
end