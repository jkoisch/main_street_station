class Fhir::ConformanceController < ApplicationController

  def index
    @conformance = File.read("#{Rails.root}/config/conformance.json")

    render json: @conformance
  end
end
