require 'spec_helper'

describe "Questionnaire" do
  describe "GET /fhir/Questionnaire_General" do
    it "should return a general questionnaire" do
      get '/fhir/Questionnaire.json', nil
      response.status.should be(200)
    end
  end

  describe "GET /fhir/metadata" do
    it "should execute the Questionnaire request" do
      get '/fhir/metadata'
      response.status.should be(200)
    end
  end
end