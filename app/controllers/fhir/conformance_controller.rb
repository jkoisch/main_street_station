class Fhir::ConformanceController < ApplicationController

  def index
    @conformance = File.read("#{Rails.root}/config/conformance.json")

    render json: @conformance
    #render xml: @conformance

    #respond_to do |format|
     # format.html
    #  format.json { render :json => @conformance }
     # format.xml #{ render :xml => @conformance }
    #end
  end
end
