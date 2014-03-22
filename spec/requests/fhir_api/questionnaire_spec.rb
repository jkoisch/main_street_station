require 'spec_helper'

describe "Questionnaire" do
  describe "GET /fhir/Questionnaire_General" do
    it "should return a general questionnaire" do
      get '/fhir/Questionnaire.json'
      response.status.should be(200)
    end
  end
end