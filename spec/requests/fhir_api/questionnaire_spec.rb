require 'spec_helper'

describe "Questionnaire" do
  describe "GET /fhir/Questionnaire" do
    it "should return a general questionnaire" do
      get '/fhir/Questionnaire.json'
      response.status.should be(200)
    end

    it "should return a bundle for an index retrieve"

    it "should return an single Questionnaire for a specific id" do
      get '/fhir/Questionnaire/1.json'
      response.status.shoud be (200)
      # TODO need to valid the returned item is a singular object
      response.body.should be(false)
    end

    it "should return an OperationOutcome for something bad"

    it {should return_single_json_object("Questionnaire")}
  end
end