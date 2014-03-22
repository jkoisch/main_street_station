require 'spec_helper'

describe "Condition" do
  describe "GET /fhir/Condition" do
    it "should return a condition" do
      get '/fhir/Condition.json', nil
      response.status.should be(200)
    end
  end
end