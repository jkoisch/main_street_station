require 'rails_helper'

RSpec.describe "Welcomes", :type => :request do
  describe "GET /" do
    before{ get root_path }

    it "should render layouts" do
      expect(response).to render_template("layouts/application")
      expect(response).to render_template("layouts/_header")
      expect(response).to render_template("layouts/_footer")
    end

    it "should successfully go to home" do
      expect(response).to have_http_status(200)
    end

    it "should successfully go to conformance" do
      get fhir_conformance_index_path
      expect(response).to have_http_status(200)
    end

    it "should successfully go to the new user signup" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end

    it "should successfully go to the about page" do
      expect(response).to have_http_status(200)
    end

  end
end
