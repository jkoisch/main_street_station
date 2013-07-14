class Fhir::ConformanceController < ApplicationController

  def index
    @conformance = File.read("#{Rails.root}/config/conformance.json")

    respond_to do |format|
      format.html
      #format.atom
      format.json
      #format.xml
    end
  end
end
