class Fhir::ConformanceController < ApplicationController

  def index
    #@data = JSON.parse("#{Rails.root}/config/conformance.json")
    @conformance = File.read("#{Rails.root}/config/conformance.json")
    @data = JSON.parse(@conformance)
    render json: @conformance
    #render xml: @data
    #respond_to do |format|
    #  format.xml
    #end
  end
end
